-- Deploy cfp:uuid_ossp to pg
-- requires: cfp_public

BEGIN;

CREATE EXTENSION "uuid-ossp";

COMMIT;
