-- Verify cfp:proposal_select on pg

BEGIN;

SELECT pg_catalog.has_table_privilege('cfp_user', 'cfp.proposal', 'SELECT');

ROLLBACK;
