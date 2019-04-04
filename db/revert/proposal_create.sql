-- Revert cfp:proposal_create from pg

BEGIN;

DROP POLICY create_proposal ON cfp.proposal;

REVOKE INSERT (author_id, title, abstract, pitch, outline, feedback) ON TABLE cfp.proposal FROM cfp_user;

COMMIT;
