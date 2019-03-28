-- Verify cfp:cfp on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('cfp', 'usage');

ROLLBACK;
