-- Revert cfp:reviewer from pg

BEGIN;

DROP TABLE cfp_public.reviewer;

COMMIT;
