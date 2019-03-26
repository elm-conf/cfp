-- Deploy cfp:reviewer to pg
-- requires: cfp_public

BEGIN;

CREATE TABLE cfp_public.reviewer (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

COMMIT;
