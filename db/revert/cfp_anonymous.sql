-- Revert cfp:cfp_anonymous from pg

BEGIN;

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA cfp_public FROM cfp_anonymous;
REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA cfp_public FROM cfp_anonymous;
REVOKE ALL PRIVILEGES ON SCHEMA cfp_public FROM cfp_anonymous;

REVOKE cfp_anonymous FROM postgraphile;
DROP ROLE cfp_anonymous;

COMMIT;
