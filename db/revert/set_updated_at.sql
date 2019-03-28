-- Revert cfp:set_updated_at from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp.set_updated_at() FROM cfp_anonymous, cfp_user;

DROP FUNCTION cfp.set_updated_at;

COMMIT;
