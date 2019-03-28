-- Verify cfp:cfp_user on pg

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname = 'cfp_anonymous';
SELECT has_schema_privilege('cfp_anonymous', 'cfp', 'usage');

ROLLBACK;
