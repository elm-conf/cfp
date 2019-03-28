-- Deploy cfp:jwt_token to pg
-- requires: cfp_public

BEGIN;

CREATE TYPE cfp_public.jwt_token AS (
  role TEXT,
  reviewer_id INTEGER
);

COMMIT;
