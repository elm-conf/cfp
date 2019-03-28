-- Verify cfp:uuid_ossp on pg

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'uuid-ossp';
SELECT has_function_privilege('uuid_generate_v1mc()', 'execute');

ROLLBACK;
