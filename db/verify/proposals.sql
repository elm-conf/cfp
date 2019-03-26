-- Verify cfp:proposals on pg

BEGIN;

SELECT id, speaker_name, speaker_email, first_time_speaker, speaker_underrepresented, title, abstract, pitch, outline, feedback, created_at, updated_at
  FROM cfp_public.proposals
 WHERE FALSE;

ROLLBACK;
