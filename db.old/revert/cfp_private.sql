-- Revert cfp:cfp_private from pg

BEGIN;

DROP SCHEMA cfp_private;

COMMIT;
