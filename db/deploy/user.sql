-- Deploy cfp:user to pg
-- requires: cfp
-- requires: current_user_id
-- requires: cfp_anonymous
-- requires: cfp_user

BEGIN;

CREATE TABLE cfp.user(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  is_reviewer BOOL NOT NULL DEFAULT FALSE
);

ALTER TABLE cfp.user ENABLE ROW LEVEL SECURITY;

GRANT SELECT ON TABLE cfp.user TO cfp_user;

GRANT UPDATE (name) ON TABLE cfp.user TO cfp_user;

CREATE POLICY update_user ON cfp.user
          FOR update
        USING (id = cfp.current_user_id());

CREATE POLICY select_own_user ON cfp.user
          FOR select
        USING (id = cfp.current_user_id());

CREATE POLICY select_all_users ON cfp.user
          FOR select
        USING (cfp.current_user_is_reviewer());

COMMIT;
