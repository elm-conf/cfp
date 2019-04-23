-- Verify cfp:add_proposal_status on pg

BEGIN;

SELECT pg_catalog.has_type_privilege('cfp_user', 'cfp.proposal_status', 'usage');

SELECT status
  FROM cfp.proposal
 WHERE FALSE;

ROLLBACK;
