-- Verify cfp:jwt_token on pg

BEGIN;

SELECT ('user', 1, FALSE)::cfp.jwt_token;

ROLLBACK;
