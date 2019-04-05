-- Revert cfp:proposal_grant_id_seq from pg

BEGIN;

REVOKE USAGE ON cfp.proposal_id_seq FROM cfp_user;

COMMIT;
