-- Revert cfp:authenticate from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp.authenticate(TEXT, TEXT) FROM cfp_anonymous, cfp_user;

DROP FUNCTION cfp.authenticate(TEXT, TEXT);

COMMIT;
