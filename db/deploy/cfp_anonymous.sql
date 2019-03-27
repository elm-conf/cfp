-- Deploy cfp:cfp_anonymous to pg

BEGIN;

CREATE ROLE cfp_anonymous;
GRANT cfp_anonymous TO postgraphile;

COMMIT;
