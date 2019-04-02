data:
	script/create-db.sh

src/Api: index.js db/deploy/*.sql db/sqitch.plan
	elm-graphql http://localhost:5100/graphql
