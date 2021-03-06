-- Deploy cfp:register to pg
-- requires: user
-- requires: user_account
-- requires: pgcrypto

BEGIN;

DROP FUNCTION IF EXISTS cfp.register;

CREATE FUNCTION cfp.register(
  name text,
  email text,
  password text
) RETURNS cfp.jwt_token AS $$
DECLARE
  new_user cfp.user;
BEGIN
  INSERT INTO cfp.user (name)
       VALUES (name)
    RETURNING *
         INTO new_user;

  INSERT INTO cfp_private.user_account (user_id, email, password_hash)
       VALUES (new_user.id, email, crypt(password, gen_salt('bf')));

  RETURN ('cfp_user', new_user.id, new_user.is_reviewer)::cfp.jwt_token;
END
$$ LANGUAGE plpgsql STRICT SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cfp.register(TEXT, TEXT, TEXT) TO cfp_anonymous;

COMMIT;
