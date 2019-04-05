-- Verify cfp:proposal_grant_id_seq on pg

BEGIN;

SELECT pg_catalog.has_sequence_privilege('cfp_user', 'cfp.proposal_id_seq', 'usage');

ROLLBACK;
