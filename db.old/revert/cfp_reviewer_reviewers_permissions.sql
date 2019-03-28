-- Revert cfp:cfp_reviewer_reviewers_permissions from pg

BEGIN;

REVOKE SELECT, UPDATE, DELETE ON TABLE cfp_public.reiewer FROM cfp_reviewer;

COMMIT;
