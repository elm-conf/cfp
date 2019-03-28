-- Revert cfp:cfp from pg

BEGIN;

DROP SCHEMA cfp;

COMMIT;
