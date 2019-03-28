-- Deploy cfp:user_account to pg
-- requires: user
-- requires: cfp_private

BEGIN;

CREATE TABLE cfp_private.user_account (
  user_id INTEGER PRIMARY KEY REFERENCES cfp.user(id) ON DELETE CASCADE,

  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL
);

COMMIT;
