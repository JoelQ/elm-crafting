module Update exposing (Msg(..), update)

import Model exposing (Ingredient, Model, Plant(..), PotionEffect(..))


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


brew : Model -> Model
brew model =
    { model | result = Just (Heal 5) }
