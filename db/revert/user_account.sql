-- Revert cfp:user_account from pg

BEGIN;

DROP TABLE cfp_private.user_account;

COMMIT;
