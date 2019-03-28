-- Revert cfp:set_updated_at from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION cfp_public.set_updated_at() TO cfp_anonymous, cfp_reviewer;

DROP FUNCTION cfp_public.set_updated_at;

COMMIT;
