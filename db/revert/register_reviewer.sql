-- Revert cfp:register_reviewer from pg

BEGIN;

DROP FUNCTION cfp_public.register_reviewer;

COMMIT;
