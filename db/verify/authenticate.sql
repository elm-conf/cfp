-- Verify cfp:authenticate on pg

BEGIN;

SELECT has_function_privilege('cfp_anonymous', 'cfp.authenticate(TEXT, TEXT)', 'execute');
SELECT has_function_privilege('cfp_user', 'cfp.authenticate(TEXT, TEXT)', 'execute');

ROLLBACK;
