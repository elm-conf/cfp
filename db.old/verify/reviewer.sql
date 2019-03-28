-- Verify cfp:reviewer on pg

BEGIN;

SELECT id, name
  FROM cfp_public.reviewer
 WHERE FALSE;

ROLLBACK;
