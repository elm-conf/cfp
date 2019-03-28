-- Verify cfp:current_user_id on pg

BEGIN;

SELECT cfp.current_user_id();

SELECT has_function_privilege('cfp_anonymous', 'cfp.current_user_id()', 'execute');
SELECT has_function_privilege('cfp_user', 'cfp.current_user_id()', 'execute');

ROLLBACK;
