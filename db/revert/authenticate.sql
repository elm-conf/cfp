-- Revert cfp:authenticate from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp_public.authenticate(TEXT, TEXT) FROM cfp_anonymous, cfp_reviewer;

DROP FUNCTION cfp_public.authenticate(TEXT, TEXT);

COMMIT;
