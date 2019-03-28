-- Deploy cfp:jwt_token to pg
-- requires: cfp

BEGIN;

CREATE TYPE cfp.jwt_token AS (
  role TEXT,
  user_id INTEGER,
  is_reviewer BOOL
);

COMMIT;
