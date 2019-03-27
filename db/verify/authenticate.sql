-- Verify cfp:authenticate on pg

BEGIN;

SELECT has_function_privilege('cfp_anonymous', 'cfp_public.authenticate(TEXT, TEXT)', 'execute');
SELECT has_function_privilege('cfp_reviewer', 'cfp_public.authenticate(TEXT, TEXT)', 'execute');

ROLLBACK;
