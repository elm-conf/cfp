-- Revert cfp:proposals_updated_at from pg

BEGIN;

DROP TRIGGER update_cfp_public_proposals_updated_at ON cfp_public.proposals;
DROP FUNCTION cfp_public.set_proposals_updated_at;

COMMIT;
