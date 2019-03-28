-- Verify cfp:uuid_ossp_permissions on pg

BEGIN;

SELECT has_function_privilege('cfp_anonymous', 'uuid_generate_v1mc()', 'execute');
SELECT has_function_privilege('cfp_reviewer', 'uuid_generate_v1mc()', 'execute');

ROLLBACK;
