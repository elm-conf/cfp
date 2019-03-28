-- Verify cfp:cfp_public on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('cfp_public', 'usage');

ROLLBACK;
