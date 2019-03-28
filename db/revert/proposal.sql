-- Revert cfp:proposal from pg

BEGIN;

DROP POLICY select_all_proposals ON cfp.proposal;
DROP POLICY select_own_proposal ON cfp.proposal;
DROP POLICY update_proposal ON cfp.proposal;

REVOKE UPDATE (title, abstract, pitch, outline, feedback) ON TABLE cfp.proposal FROM cfp_user;
REVOKE SELECT ON TABLE cfp.proposal FROM cfp_user;

DROP TRIGGER update_updated_at ON cfp.proposal;

DROP INDEX cfp.idx_proposal_author_id;

DROP TABLE cfp.proposal;

COMMIT;
