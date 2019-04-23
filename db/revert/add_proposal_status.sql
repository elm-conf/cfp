-- Revert cfp:add_proposal_status from pg

BEGIN;

ALTER TABLE cfp.proposal DROP COLUMN status;

DROP TYPE cfp.proposal_status;

COMMIT;
