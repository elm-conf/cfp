-- Revert cfp:comment from pg

BEGIN;

DROP POLICY delete_comment ON cfp_public.comment;
DROP POLICY update_comment ON cfp_public.comment;

REVOKE SELECT, UPDATE, DELETE ON TABLE cfp_public.comment FROM cfp_reviewer;

DROP TRIGGER update_cfp_public_comment_updated_at ON cfp_public.comment;

DROP TABLE cfp_public.comment;

COMMIT;
