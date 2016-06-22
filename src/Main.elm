module Main exposing (..)

import Html.App exposing (beginnerProgram)
import Html exposing (..)
import Html.Attributes exposing (type')
import Html.Events exposing (onInput, onClick)
import String


type PotionEffect
    = Heal Int
    | Energize Int
    | Poison Int


type Plant
    = Rosmary
    | Thyme
    | Elderberry
    | MustardSeed


type alias Ingredient =
    ( Plant, Int )


brew : Model -> Model
brew model =
    { model | result = Just (Heal 5) }


type alias Model =
    { rosemary : Int
    , thyme : Int
    , elderberry : Int
    , mustardSeed : Int
    , result : Maybe PotionEffect
    }


initialModel : Model
initialModel =
    { rosemary = 0
    , thyme = 0
    , elderberry = 0
    , mustardSeed = 0
    , result = Nothing
    }


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }


view : Model -> Html Msg
view model =
    main' []
        [ h1 [] [ text "Crafting" ]
        , addIngredient
        , button [ onClick Brew ] [ text "Brew this potion!" ]
        , result model.result
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


type Msg
    = AddIngredient Ingredient
    | Brew


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddIngredient ingredient ->
            setIngredient ingredient model

        Brew ->
            brew model


setIngredient : Ingredient -> Model -> Model
setIngredient ingredient model =
    case ingredient of
        ( Rosmary, n ) ->
            { model | rosemary = n }

        ( Thyme, n ) ->
            { model | thyme = n }

        ( Elderberry, n ) ->
            { model | elderberry = n }

        ( MustardSeed, n ) ->
            { model | mustardSeed = n }
