-- Revert cfp:cfp_user from pg

BEGIN;

REVOKE USAGE ON SCHEMA cfp FROM cfp_user;

DROP ROLE cfp_user;

COMMIT;
