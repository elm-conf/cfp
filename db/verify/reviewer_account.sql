-- Verify cfp:reviewer_account on pg

BEGIN;

SELECT reviewer_id, email, password_hash
  FROM cfp_private.reviewer_account
 WHERE FALSE;

ROLLBACK;
