-- Deploy cfp:proposal_create to pg
-- requires: proposal

BEGIN;

GRANT INSERT (author_id, title, abstract, pitch, outline, feedback) ON TABLE cfp.proposal TO cfp_user;

CREATE POLICY create_proposal ON cfp.proposal
          FOR insert
   WITH CHECK (author_id = cfp.current_user_id());

COMMIT;
