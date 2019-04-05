-- Deploy cfp:proposal_grant_id_seq to pg
-- requires: proposal
-- requires: cfp_user

BEGIN;

GRANT USAGE ON cfp.proposal_id_seq TO cfp_user;

COMMIT;
