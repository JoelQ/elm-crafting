module Main exposing (..)

import Update exposing (update)
import Model exposing (Model)
import View exposing (view)
import Html.App exposing (beginnerProgram)


main =
    beginnerProgram
        { model = Model.initialModel
        , view = view
        , update = update
        }
