-- Revert cfp:cfp_reviewer from pg

BEGIN;

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA cfp_public FROM cfp_reviewer;
REVOKE ALL PRIVILEGES ON SCHEMA cfp_public FROM cfp_reviewer;

REVOKE cfp_reviewer FROM postgraphile;
DROP ROLE cfp_reviewer;

COMMIT;
