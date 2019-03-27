#!/usr/bin/env bash
initdb data

# start DB but clean it up when we're done
foreman start db &
DB=$!
finish() {
    kill $DB
}
trap finish EXIT

# now create the database
sleep 1
createdb -e cfp
psql -d cfp -c "CREATE ROLE postgraphile LOGIN PASSWORD 'dev';"
psql -d cfp -c "ALTER USER postgraphile WITH SUPERUSER;"
