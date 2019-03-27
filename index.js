const http = require("http");
const { postgraphile } = require("postgraphile");

const graphiql = process.env.NODE_ENV !== "production";
const server = postgraphile(
  process.env.DATABASE_URL || "postgres://postgraphile:dev@localhost/cfp",
  process.env.SCHEMA_NAME || "cfp_public",
  {
    appendPlugins: [
      require("@graphile-contrib/pg-simplify-inflector")
    ],

    // security
    defaultRole: 'cfp_anonymous',
    secret: process.env.JWT_SECRET || 'super bad dev secret',
    token: 'cfp_public.jwt_token',

    // deveopment
    watchPg: true,
    graphiql: graphiql,
    enhanceGraphiql: graphiql,

    // TODO: errors. There are nice options here: https://www.graphile.org/postgraphile/usage-library/
  }
);

const port = process.env.PORT || 3000;

console.log(`listening on :${port}`);
if (graphiql) { console.log("graphihql running at /graphiql"); }

http.createServer(server).listen(port);
