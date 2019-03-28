-- Deploy cfp:cfp_anonymous to pg

BEGIN;

CREATE ROLE cfp_anonymous;
GRANT cfp_anonymous TO postgraphile;

GRANT USAGE ON SCHEMA cfp_public TO cfp_anonymous;
GRANT SELECT ON TABLE cfp_public.proposals TO cfp_anonymous;

GRANT UPDATE (speaker_name, speaker_email, first_time_speaker, speaker_underrepresented, title, abstract, pitch, outline, feedback)
    ON TABLE cfp_public.proposals
          TO cfp_anonymous;

GRANT INSERT (speaker_name, speaker_email, first_time_speaker, speaker_underrepresented, title, abstract, pitch, outline, feedback)
    ON TABLE cfp_public.proposals
          TO cfp_anonymous;

GRANT EXECUTE ON FUNCTION cfp_public.register_reviewer(TEXT, TEXT, TEXT) TO cfp_anonymous;

COMMIT;
