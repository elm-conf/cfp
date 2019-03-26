-- Revert cfp:uuid_ossp from pg

BEGIN;

DROP EXTENSION "uuid-ossp";

COMMIT;
