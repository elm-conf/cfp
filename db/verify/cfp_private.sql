-- Verify cfp:cfp_private on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('cfp_private', 'usage');

ROLLBACK;
