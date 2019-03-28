-- Deploy cfp:current_user_id to pg
-- requires: jwt_token

BEGIN;

CREATE FUNCTION cfp.current_user_id() RETURNS INT AS $$
  SELECT nullif(current_setting('jwt.claims.user_id', true), '')::int;
$$ LANGUAGE sql STRICT;

COMMENT ON FUNCTION cfp.current_user_id() IS '@omit';

GRANT EXECUTE ON FUNCTION cfp.current_user_id() TO cfp_anonymous, cfp_user;

COMMIT;
