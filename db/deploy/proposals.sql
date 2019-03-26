-- Deploy cfp:proposals to pg
-- requires: cfp_public
-- requires: uuid_ossp

BEGIN;

CREATE TABLE cfp_public.proposals (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),

  -- speaker info
  speaker_name TEXT NOT NULL,
  speaker_email TEXT NOT NULL,
  first_time_speaker BOOL NOT NULL DEFAULT FALSE,
  speaker_underrepresented BOOL NOT NULL DEFAULT FALSE,

  -- talk info
  title TEXT NOT NULL,
  abstract TEXT NOT NULL,
  pitch TEXT NOT NULL,
  outline TEXT NOT NULL,
  feedback TEXT NOT NULL,

  -- metadata
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMIT;
