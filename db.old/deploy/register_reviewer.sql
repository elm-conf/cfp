-- Deploy cfp:register_reviewer to pg

BEGIN;

CREATE FUNCTION cfp_public.register_reviewer(
  name text,
  email text,
  password text
) RETURNS cfp_public.reviewer AS $$
DECLARE
  reviewer cfp_public.reviewer;
BEGIN
  INSERT INTO cfp_public.reviewer (name)
       VALUES (name)
    RETURNING *
         INTO reviewer;

  INSERT INTO cfp_private.reviewer_account (reviewer_id, email, password_hash)
       VALUES (reviewer.id, email, crypt(password, gen_salt('bf')));

  RETURN reviewer;
END
$$ LANGUAGE plpgsql STRICT SECURITY DEFINER;

COMMENT ON FUNCTION cfp_public.register_reviewer(text, text, text) IS 'Register a single reviewer and create an account for them.';

COMMIT;
