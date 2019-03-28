-- Deploy cfp:cfp_user to pg
-- requires: cfp
-- requires: jwt_token

BEGIN;

CREATE ROLE cfp_user;
GRANT cfp_user TO postgraphile;

GRANT USAGE ON SCHEMA cfp TO cfp_user;

COMMIT;
