-- Deploy cfp:reviewer_account to pg
-- requires: cfp_private

BEGIN;

CREATE TABLE cfp_private.reviewer_account (
  reviewer_id        INTEGER PRIMARY KEY REFERENCES cfp_public.reviewer(id) ON DELETE CASCADE,
  email              TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL
);

COMMIT;
