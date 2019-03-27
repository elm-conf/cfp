-- Revert cfp:cfp_anonymous from pg

BEGIN;

DROP ROLE cfp_anonymous;

COMMIT;
