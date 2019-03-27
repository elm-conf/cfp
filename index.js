const http = require("http");
const { postgraphile } = require("postgraphile");

const graphiql = process.env.NODE_ENV !== "production";
const server = postgraphile(
  process.env.DATABASE_URL || "postgres://postgraphile:dev@localhost/cfp",
  process.env.SCHEMA_NAME || "cfp_public",
  {
    watchPg: true,
    appendPlugins: [
      require("@graphile-contrib/pg-simplify-inflector")
    ],
    graphiql: graphiql,
    enhanceGraphiql: graphiql,
    // TODO: errors. There are nice options here: https://www.graphile.org/postgraphile/usage-library/
  }
);

const port = process.env.PORT || 3000;

console.log(`listening on :${port}`);
if (graphiql) { console.log("graphihql running at /graphiql"); }

http.createServer(server).listen(port);
