-- Verify cfp:register on pg

BEGIN;

SELECT pg_catalog.has_function_privilege('cfp_anonymous', 'cfp.register(TEXT, TEXT, TEXT)', 'execute');

ROLLBACK;
