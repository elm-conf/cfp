app.nix: package.json package-lock.json
	node2nix --lock package-lock.json --input package.json --composition $@ --nodejs-8

data:
	script/create-db.sh

src/Api: index.js db/deploy/*.sql db/sqitch.plan
	elm-graphql http://localhost:5100/graphql
