-- Revert cfp:cfp_reviewer from pg

BEGIN;

DROP ROLE cfp_reviewer;

COMMIT;
