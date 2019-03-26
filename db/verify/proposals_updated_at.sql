-- Verify cfp:proposals_updated_at on pg

BEGIN;

SELECT has_function_privilege('cfp_public.set_proposals_updated_at()', 'execute');
SELECT 1/count(*) FROM pg_trigger WHERE tgname = 'update_cfp_public_proposals_updated_at';

ROLLBACK;
