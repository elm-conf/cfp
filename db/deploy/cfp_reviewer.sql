-- Deploy cfp:cfp_reviewer to pg

BEGIN;

CREATE ROLE cfp_reviewer;
GRANT cfp_reviewer TO postgraphile;

GRANT USAGE ON SCHEMA cfp_public to cfp_reviewer;
GRANT SELECT, DELETE ON TABLE cfp_public.proposals TO cfp_reviewer;

GRANT UPDATE (speaker_name, speaker_email, first_time_speaker, speaker_underrepresented, title, abstract, pitch, outline, feedback)
    ON TABLE cfp_public.proposals
          TO cfp_reviewer;

GRANT INSERT (speaker_name, speaker_email, first_time_speaker, speaker_underrepresented, title, abstract, pitch, outline, feedback)
    ON TABLE cfp_public.proposals
          TO cfp_reviewer;

COMMIT;
