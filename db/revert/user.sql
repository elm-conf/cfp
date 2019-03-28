-- Revert cfp:user from pg

BEGIN;

DROP POLICY select_all_users ON cfp.user;
DROP POLICY select_own_user ON cfp.user;
DROP POLICY update_user ON cfp.user;

REVOKE UPDATE (name) ON TABLE cfp.user FROM cfp_user;
REVOKE SELECT ON TABLE cfp.user FROM cfp_user;

DROP TABLE cfp.user;

COMMIT;
