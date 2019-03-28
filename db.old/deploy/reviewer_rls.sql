-- Deploy cfp:reviewer_rls to pg
-- requires: reviewer

BEGIN;

ALTER TABLE cfp_public.reviewer ENABLE ROW LEVEL SECURITY;

CREATE POLICY select_reviewer
           ON cfp_public.reviewer
          FOR select
        USING (current_setting('jwt.claims.role', true) = 'cfp_reviewer');

CREATE POLICY update_reviewer
           ON cfp_public.reviewer
          FOR update
        USING (id = nullif(current_setting('jwt.claims.reviewer_id', true), '')::INTEGER);

COMMIT;
