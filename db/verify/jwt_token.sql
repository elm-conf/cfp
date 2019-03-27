-- Verify cfp:jwt_token on pg

BEGIN;

SELECT ('role', 1)::cfp_public.jwt_token;

ROLLBACK;
