-- Revert cfp:cfp_anonymous from pg

BEGIN;

REVOKE USAGE ON SCHEMA cfp FROM cfp_anonymous;

DROP ROLE cfp_anonymous;

COMMIT;
