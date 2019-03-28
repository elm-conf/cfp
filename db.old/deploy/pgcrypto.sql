-- Deploy cfp:pgcrypto to pg

BEGIN;

CREATE EXTENSION "pgcrypto";

COMMIT;
