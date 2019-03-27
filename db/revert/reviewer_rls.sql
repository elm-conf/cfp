-- Revert cfp:reviewer_rls from pg

BEGIN;

DROP POLICY update_reviewer ON cfp_public.reviewer;
DROP POLICY select_reviewer ON cfp_public.reviewer;
ALTER TABLE cfp_public.reviewer DISABLE ROW LEVEL SECURITY;

COMMIT;
