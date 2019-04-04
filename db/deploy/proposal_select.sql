-- Deploy cfp:proposal_select to pg
-- requires: proposal

BEGIN;

GRANT SELECT ON TABLE cfp.proposal TO cfp_user;

COMMIT;
