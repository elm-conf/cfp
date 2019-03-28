-- Revert cfp:proposals from pg

BEGIN;

DROP TABLE cfp_public.proposals;

COMMIT;
