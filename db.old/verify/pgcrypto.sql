-- Verify cfp:pgcrypto on pg

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'pgcrypto';
SELECT has_function_privilege('crypt(TEXT, TEXT)', 'execute');

ROLLBACK;
