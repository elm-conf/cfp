-- Verify cfp:set_updated_at on pg

BEGIN;

SELECT has_function_privilege('cfp_anonymous', 'cfp_public.set_updated_at()', 'execute');
SELECT has_function_privilege('cfp_reviewer', 'cfp_public.set_updated_at()', 'execute');

ROLLBACK;
