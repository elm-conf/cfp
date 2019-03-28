-- Verify cfp:user on pg

BEGIN;

SELECT id, name, first_time_speaker, speaker_underrepresented, is_reviewer, created_at, updated_at
  FROM cfp.user
 WHERE FALSE;

SELECT pg_catalog.has_table_privilege('cfp_user', 'cfp.user', 'select');
SELECT pg_catalog.has_table_privilege('cfp_user', 'cfp.user', 'update');

SELECT 1/count(*) FROM pg_policies WHERE schemaname = 'cfp' AND policyname = 'update_user';
SELECT 1/count(*) FROM pg_policies WHERE schemaname = 'cfp' AND policyname = 'select_own_user';
SELECT 1/count(*) FROM pg_policies WHERE schemaname = 'cfp' AND policyname = 'select_all_users';

ROLLBACK;
