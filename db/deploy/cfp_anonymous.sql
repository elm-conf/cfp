-- Deploy cfp:cfp_anonymous to pg
-- requires: cfp
-- requires: cfp_private

BEGIN;

CREATE ROLE cfp_anonymous;
GRANT cfp_anonymous TO postgraphile;

GRANT USAGE ON SCHEMA cfp TO cfp_anonymous;

COMMIT;
