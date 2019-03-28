-- Deploy cfp:comment to pg
-- requires: cfp_public
-- requires: cfp_reviewer
-- requires: set_updated_at

BEGIN;

CREATE TABLE cfp_public.comment(
  id SERIAL PRIMARY KEY,

  proposal_id UUID NOT NULL REFERENCES cfp_public.proposals(id) ON DELETE CASCADE,
  reviewer_id INTEGER NOT NULL REFERENCES cfp_public.reviewer(id),

  content TEXT NOT NULL,

  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

ALTER TABLE cfp_public.comment ENABLE ROW LEVEL SECURITY;

-- triggers

CREATE TRIGGER update_cfp_public_comment_updated_at
BEFORE UPDATE ON cfp_public.comment
FOR EACH ROW EXECUTE PROCEDURE cfp_public.set_updated_at();

-- indexes

CREATE INDEX idx_comment_proposal_id ON cfp_public.comment(proposal_id);
CREATE INDEX idx_comment_reviewer_id ON cfp_public.comment(reviewer_id);

-- nothing for anonymous role!

-- reviewer role
GRANT SELECT, UPDATE, DELETE ON TABLE cfp_public.comment TO cfp_reviewer;

CREATE POLICY update_comment ON cfp_public.comment
          FOR update
        USING (reviewer_id = nullif(current_setting('jwt.claims.reviewer_id', true), '')::INTEGER);

CREATE POLICY delete_comment ON cfp_public.comment
          FOR delete
        USING (reviewer_id = nullif(current_setting('jwt.claims.reviewer_id', true), '')::INTEGER);

COMMIT;
