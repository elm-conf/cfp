-- Deploy cfp:user to pg
-- requires: cfp
-- requires: current_user_id
-- requires: cfp_anonymous
-- requires: cfp_user
-- requires: set_updated_at

BEGIN;

CREATE TABLE cfp.user(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,

  -- speaker info
  first_time_speaker BOOL NOT NULL DEFAULT FALSE,
  speaker_underrepresented BOOL NOT NULL DEFAULT FALSE,

  -- reviewer info
  is_reviewer BOOL NOT NULL DEFAULT FALSE,

  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE cfp.user IS '@omit create,delete';

ALTER TABLE cfp.user ENABLE ROW LEVEL SECURITY;

-- triggers

CREATE TRIGGER update_updated_at
BEFORE UPDATE ON cfp.user
FOR EACH ROW EXECUTE PROCEDURE cfp.set_updated_at();

-- permissions

GRANT SELECT ON TABLE cfp.user TO cfp_user;

GRANT UPDATE (name, first_time_speaker, speaker_underrepresented) ON TABLE cfp.user TO cfp_user;

CREATE POLICY update_user ON cfp.user
          FOR update
        USING (id = cfp.current_user_id());

CREATE POLICY select_own_user ON cfp.user
          FOR select
        USING (id = cfp.current_user_id());

CREATE POLICY select_all_users ON cfp.user
          FOR select
        USING (cfp.current_user_is_reviewer() = true);

COMMIT;
