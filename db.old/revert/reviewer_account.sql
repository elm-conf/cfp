-- Revert cfp:reviewer_account from pg

BEGIN;

DROP TABLE cfp_private.reviewer_account;

COMMIT;
