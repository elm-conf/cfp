CREATE OR REPLACE FUNCTION assert_eq(anyelement, anyelement) RETURNS VOID LANGUAGE plpgsql AS $$
BEGIN
  IF $1 IS DISTINCT FROM $2 THEN
    RAISE EXCEPTION '% IS DISTINCT FROM %', $1, $2;
  END IF;
END;
$$;