-- Deploy cfp:authenticate to pg
-- requires: cfp_public
-- requires: cfp_anonymous
-- requires: cfp_reviewer
-- requires: jwt_token

BEGIN;

CREATE FUNCTION cfp_public.authenticate(
  email TEXT,
  password TEXT
) RETURNS cfp_public.jwt_token AS $$
DECLARE
  account cfp_private.reviewer_account;
BEGIN
  SELECT * INTO account
    FROM cfp_private.reviewer_account
   WHERE email = $1;

  IF account.password_hash = crypt(password, account.password_hash) THEN
    RETURN ('cfp_reviewer', account.reviewer_id)::cfp_public.jwt_token;
  ELSE
    RETURN NULL;
  END IF;
END;
$$ language plpgsql STRICT SECURITY DEFINER;

COMMENT ON FUNCTION cfp_public.authenticate(TEXT, TEXT) IS 'Creates a JWT token that will identify further calls.';

GRANT EXECUTE ON FUNCTION cfp_public.authenticate(TEXT, TEXT) TO cfp_anonymous, cfp_reviewer;

COMMIT;
