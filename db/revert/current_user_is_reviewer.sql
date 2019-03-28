-- Revert cfp:current_user_is_reviewer from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp.current_user_is_reviewer() FROM cfp_anonymous, cfp_user;

DROP FUNCTION cfp.current_user_is_reviewer();

COMMIT;
