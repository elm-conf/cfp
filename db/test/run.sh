#!/usr/bin/env bash
set -euo pipefail

TEST_DIR="$(dirname ${0:-})"

for testname in $TEST_DIR/test_*.sql; do
    echo "$testname"
    psql -d cfp -c 'BEGIN;' -c "\i $testname;" -c 'ROLLBACK;'
done
