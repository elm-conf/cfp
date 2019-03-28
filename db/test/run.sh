#!/usr/bin/env bash
set -euo pipefail

TEST_DIR="$(dirname ${0:-})"

EXIT=0

for testname in $TEST_DIR/test_*.sql; do
    echo "========== $(basename $testname)"
    psql -d cfp -c 'BEGIN;' -c "\i $testname;" -c 'ROLLBACK;'
    if test "$?" -ne 0; then EXIT=1; fi
    echo
done

exit "$EXIT"
