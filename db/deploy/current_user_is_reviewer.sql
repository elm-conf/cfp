-- Deploy cfp:current_user_is_reviewer to pg
-- requires: cfp

BEGIN;

CREATE FUNCTION cfp.current_user_is_reviewer() RETURNS BOOL as $$
  SELECT nullif(current_setting('jwt.claims.user_id', true), '')::BOOL;
$$ LANGUAGE sql STRICT;

COMMENT ON FUNCTION cfp.current_user_is_reviewer() IS '@omit';

GRANT EXECUTE ON FUNCTION cfp.current_user_is_reviewer() TO cfp_anonymous, cfp_user;

COMMIT;
