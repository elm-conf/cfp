-- Revert cfp:cfp_public from pg

BEGIN;

DROP SCHEMA cfp_public;

COMMIT;
