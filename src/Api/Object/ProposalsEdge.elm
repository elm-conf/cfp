-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.ProposalsEdge exposing (cursor, node)

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


{-| A cursor for use in pagination.
-}
cursor : SelectionSet (Maybe Api.ScalarCodecs.Cursor) Api.Object.ProposalsEdge
cursor =
    Object.selectionForField "(Maybe ScalarCodecs.Cursor)" "cursor" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecCursor |> .decoder |> Decode.nullable)


{-| The `Proposal` at the end of the edge.
-}
node : SelectionSet decodesTo Api.Object.Proposal -> SelectionSet (Maybe decodesTo) Api.Object.ProposalsEdge
node object_ =
    Object.selectionForCompositeField "node" [] object_ (identity >> Decode.nullable)
