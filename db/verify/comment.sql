-- Verify cfp:comment on pg

BEGIN;

SELECT id, proposal_id, reviewer_id, created_at, updated_at
  FROM cfp_public.comment
 WHERE FALSE;

SELECT 1/count(*) FROM pg_trigger WHERE tgname = 'update_cfp_public_comment_updated_at';

ROLLBACK;
