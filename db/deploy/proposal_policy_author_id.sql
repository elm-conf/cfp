-- Deploy cfp:proposal_policy_author_id to pg
-- requires: proposal

BEGIN;

ALTER POLICY update_proposal ON cfp.proposal
       USING (author_id = cfp.current_user_id());

ALTER POLICY select_own_proposal ON cfp.proposal
       USING (author_id = cfp.current_user_id());

COMMIT;
