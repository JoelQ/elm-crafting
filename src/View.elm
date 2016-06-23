module View exposing (view)

import Model exposing (Model, Plant(..), PotionEffect(..))
import Update exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (type')
import Html.Events exposing (onInput, onClick)
import String


view : Model -> Html Msg
view model =
    main' []
        [ h1 [] [ text "Crafting" ]
        , addIngredient
        , button [ onClick Brew ] [ text "Brew this potion!" ]
        , result model.result
        ]


addIngredient : Html Msg
addIngredient =
    div []
        [ ingredientInput Rosmary
        , ingredientInput Thyme
        , ingredientInput Elderberry
        , ingredientInput MustardSeed
        ]


ingredientInput : Plant -> Html Msg
ingredientInput plant =
    let
        intFromString s =
            Result.withDefault 1 (String.toInt s)
    in
        label []
            [ text (toString plant)
            , input
                [ type' "number"
                , onInput (\n -> AddIngredient ( plant, intFromString n ))
                ]
                []
            ]


result : Maybe PotionEffect -> Html a
result effect =
    case effect of
        Nothing ->
            p []
                [ em [] [ text "Nothing to brew" ] ]

        Just effect' ->
            p []
                [ strong [] [ text (resultText effect') ] ]


resultText : PotionEffect -> String
resultText effect =
    case effect of
        Heal n ->
            "Heal " ++ (toString n)

        Energize n ->
            "Energize " ++ (toString n)

        Poison n ->
            "Poison " ++ (toString n)
