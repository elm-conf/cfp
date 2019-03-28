-- Revert cfp:uuid_ossp_permissions from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION uuid_generate_v1mc() FROM cfp_anonymous, cfp_reviewer;

COMMIT;
