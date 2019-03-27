-- Verify cfp:cfp_reviewer on pg

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname = 'cfp_reviewer';

ROLLBACK;
