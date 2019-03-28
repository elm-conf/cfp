-- Deploy cfp:uuid_ossp_permissions to pg
-- requires: uuid_ossp
-- requires: cfp_reviewer
-- requires: cfp_anonymous

BEGIN;

GRANT EXECUTE ON FUNCTION uuid_generate_v1mc() TO cfp_anonymous, cfp_reviewer;

COMMIT;
