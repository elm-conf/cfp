-- Verify cfp:set_updated_at on pg

BEGIN;

SELECT has_function_privilege('cfp_anonymous', 'cfp.set_updated_at()', 'execute');
SELECT has_function_privilege('cfp_user', 'cfp.set_updated_at()', 'execute');

ROLLBACK;
