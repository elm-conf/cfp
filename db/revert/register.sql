-- Revert cfp:register from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp.register(TEXT, TEXT, TEXT) FROM cfp_anonymous;

DROP FUNCTION cfp.register;

COMMIT;
