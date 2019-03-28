const http = require("http");
const { postgraphile } = require("postgraphile");

const inProduction = process.env.NODE_ENV;
const server = postgraphile(
  process.env.DATABASE_URL || "postgres://postgraphile:dev@localhost/cfp",
  process.env.SCHEMA_NAME || "cfp_public",
  {
    appendPlugins: [
      require("@graphile-contrib/pg-simplify-inflector")
    ],

    // security
    pgDefaultRole: 'cfp_anonymous',
    jwtSecret: process.env.JWT_SECRET || 'super bad dev secret',
    jwtPgTypeIdentifier: 'cfp_public.jwt_token',

    // development
    watchPg: true,
    graphiql: !inProduction,
    enhanceGraphiql: !inProduction,

    // logging
    disableQueryLog: inProduction,

    // TODO: errors. There are nice options here: https://www.graphile.org/postgraphile/usage-library/
  }
);

const port = process.env.PORT || 3000;

console.log(`listening on :${port}`);
if (!inProduction) { console.log("graphihql running at /graphiql"); }

http.createServer(server).listen(port);
