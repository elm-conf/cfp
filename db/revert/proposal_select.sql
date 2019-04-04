-- Revert cfp:proposal_select from pg

BEGIN;

REVOKE SELECT ON TABLE cfp.proposal FROM cfp_user;

COMMIT;
