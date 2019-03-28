-- Deploy cfp:set_updated_at to pg
-- requires: cfp_public

BEGIN;

CREATE OR REPLACE FUNCTION cfp_public.set_updated_at() RETURNS trigger AS $$
BEGIN
  new."updated_at" := now();
  RETURN new;
END
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION cfp_public.set_updated_at() TO cfp_anonymous, cfp_reviewer;

COMMIT;
