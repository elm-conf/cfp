-- Verify cfp:cfp_anonymous on pg

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname = 'cfp_anonymous';

ROLLBACK;
