-- Revert cfp:jwt_token from pg

BEGIN;

DROP TYPE cfp_public.jwt_token;

COMMIT;
