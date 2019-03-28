-- Deploy cfp:authenticate to pg
-- requires: cfp_anonymous

BEGIN;

CREATE FUNCTION cfp.authenticate(
  email TEXT,
  password TEXT
) RETURNS cfp.jwt_token AS $$
DECLARE
  account cfp_private.user_account;
  user_ cfp.user;
BEGIN
  SELECT a.* INTO account
    FROM cfp_private.user_account AS a
   WHERE a.email = $1;

  SELECT u.* INTO user_
    FROM cfp.user AS u
   WHERE u.id = account.user_id;

  IF account.password_hash = crypt(password, account.password_hash) THEN
    RETURN ('cfp_user', account.user_id, user_.is_reviewer)::cfp.jwt_token;
  ELSE
    RETURN NULL;
  END IF;
END;
$$ language plpgsql STRICT SECURITY DEFINER;

COMMENT ON FUNCTION cfp.authenticate(TEXT, TEXT) IS 'Creates a JWT token that will identify further calls.';

GRANT EXECUTE ON FUNCTION cfp.authenticate(TEXT, TEXT) TO cfp_anonymous, cfp_user;

COMMIT;
