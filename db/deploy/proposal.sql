-- Deploy cfp:proposal to pg
-- requires: cfp
-- requires: cfp_user
-- requires: cfp_anonymous
-- requires: set_updated_at
-- requires: user

BEGIN;

CREATE TABLE cfp.proposal(
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL REFERENCES cfp.user(id),

  -- talk info
  title TEXT NOT NULL,
  abstract TEXT NOT NULL,
  pitch TEXT NOT NULL,
  outline TEXT NOT NULL,
  feedback TEXT NOT NULL,

  -- metadata
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE cfp.proposal IS '@omit delete';

-- indexes

CREATE INDEX idx_proposal_author_id ON cfp.proposal(author_id);

-- triggers

CREATE TRIGGER update_updated_at
BEFORE UPDATE ON cfp.proposal
FOR EACH ROW EXECUTE PROCEDURE cfp.set_updated_at();

-- permissions

GRANT SELECT ON TABLE cfp.user TO cfp_user;

GRANT UPDATE (title, abstract, pitch, outline, feedback) ON TABLE cfp.proposal TO cfp_user;

ALTER TABLE cfp.proposal ENABLE ROW LEVEL SECURITY;

CREATE POLICY update_proposal ON cfp.proposal
          FOR update
        USING (id = cfp.current_user_id());

CREATE POLICY select_own_proposal ON cfp.proposal
          FOR select
        USING (id = cfp.current_user_id());

CREATE POLICY select_all_proposals ON cfp.proposal
          FOR select
        USING (cfp.current_user_is_reviewer());

COMMIT;
