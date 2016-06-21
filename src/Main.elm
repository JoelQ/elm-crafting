module Main exposing (..)

import Html.App exposing (beginnerProgram)
import Html exposing (..)


main =
    beginnerProgram
        { model = ""
        , view = view
        , update = update
        }


view : a -> Html a
view _ =
    h1 [] [ text "Crafting" ]


update : a -> String -> String
update _ model =
    model
