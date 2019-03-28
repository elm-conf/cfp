-- Revert cfp:current_user_id from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp.current_user_id() FROM cfp_anonymous, cfp_user;

DROP FUNCTION cfp.current_user_id();

COMMIT;
