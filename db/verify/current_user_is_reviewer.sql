-- Verify cfp:current_user_is_reviewer on pg

BEGIN;

SELECT cfp.current_user_is_reviewer();

SELECT has_function_privilege('cfp_anonymous', 'cfp.current_user_is_reviewer()', 'execute');
SELECT has_function_privilege('cfp_user', 'cfp.current_user_is_reviewer()', 'execute');

ROLLBACK;
