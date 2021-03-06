-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.UsersConnection exposing (edges, nodes, pageInfo, totalCount)

import Api.InputObject
import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| A list of `User` objects.
-}
nodes : SelectionSet decodesTo Api.Object.User -> SelectionSet (List (Maybe decodesTo)) Api.Object.UsersConnection
nodes object_ =
    Object.selectionForCompositeField "nodes" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| A list of edges which contains the `User` and cursor to aid in pagination.
-}
edges : SelectionSet decodesTo Api.Object.UsersEdge -> SelectionSet (List decodesTo) Api.Object.UsersConnection
edges object_ =
    Object.selectionForCompositeField "edges" [] object_ (identity >> Decode.list)


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet decodesTo Api.Object.PageInfo -> SelectionSet decodesTo Api.Object.UsersConnection
pageInfo object_ =
    Object.selectionForCompositeField "pageInfo" [] object_ identity


{-| The count of _all_ `User` you could get from the connection.
-}
totalCount : SelectionSet (Maybe Int) Api.Object.UsersConnection
totalCount =
    Object.selectionForField "(Maybe Int)" "totalCount" [] (Decode.int |> Decode.nullable)
