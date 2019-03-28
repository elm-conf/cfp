-- Deploy cfp:cfp_reviewer_reviewers_permissions to pg
-- requires: cfp_reviewer
-- requires: reviewer

BEGIN;

GRANT SELECT, UPDATE, DELETE ON TABLE cfp_public.reviewer TO cfp_reviewer;

COMMIT;
