-- Verify cfp:register_reviewer on pg

BEGIN;

SELECT has_function_privilege('cfp_public.register_reviewer(TEXT, TEXT, TEXT)', 'execute');

ROLLBACK;
