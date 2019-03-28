-- Revert cfp:jwt_token from pg

BEGIN;

DROP TYPE cfp.jwt_token;

COMMIT;
