-- Deploy cfp:proposals_updated_at to pg
-- requires: proposals

BEGIN;

CREATE OR REPLACE FUNCTION cfp_public.set_proposals_updated_at() RETURNS trigger AS $$
BEGIN
  NEW."updated_at" := now();
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_cfp_public_proposals_updated_at
BEFORE UPDATE ON cfp_public.proposals
FOR EACH ROW EXECUTE PROCEDURE cfp_public.set_proposals_updated_at();

COMMIT;
