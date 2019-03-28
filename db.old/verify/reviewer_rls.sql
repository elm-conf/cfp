-- Verify cfp:reviewer_rls on pg

BEGIN;

SELECT 1/count(*) FROM pg_policies WHERE schemaname = 'cfp_public' AND policyname = 'select_reviewer';
SELECT 1/count(*) FROM pg_policies WHERE schemaname = 'cfp_public' AND policyname = 'update_reviewer';

ROLLBACK;
