-- Revert cfp:proposal_policy_author_id from pg

BEGIN;

ALTER POLICY update_proposal ON cfp.proposal
       USING (id = cfp.current_user_id());

ALTER POLICY select_own_proposal ON cfp.proposal
       USING (id = cfp.current_user_id());

COMMIT;
