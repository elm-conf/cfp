-- Deploy cfp:add_proposal_status to pg
-- requires: proposal

BEGIN;

CREATE TYPE cfp.proposal_status AS ENUM ('draft', 'published');

ALTER TABLE cfp.proposal ADD COLUMN status cfp.proposal_status DEFAULT 'published';

COMMIT;
