-- Revert cfp:reviewer_rls from pg

BEGIN;

DROP POLICY update_reviewer;
DROP POLICY select_reviewer;
ALTER TABLE cfp_public.reviewer DISABLE ROW LEVEL SECURITY;

COMMIT;
