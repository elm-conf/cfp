-- Revert cfp:pgcrypto from pg

BEGIN;

DROP EXTENSION "pgcrypto";

COMMIT;
