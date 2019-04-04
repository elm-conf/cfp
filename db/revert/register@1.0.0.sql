-- Revert cfp:register from pg

BEGIN;

DROP FUNCTION IF EXISTS cfp.register;

COMMIT;
