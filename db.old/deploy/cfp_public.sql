-- Deploy cfp:cfp_public to pg

BEGIN;

CREATE SCHEMA cfp_public;

ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM public;

COMMIT;