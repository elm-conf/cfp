-- Verify cfp:user_account on pg

BEGIN;

SELECT user_id, email, password_hash
  FROM cfp_private.user_account
 WHERE FALSE;

ROLLBACK;
