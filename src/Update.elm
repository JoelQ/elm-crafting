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

        -- ( Elderberry, n ) ->
        --     { model | elderberry = n }
        --
        -- ( MustardSeed, n ) ->
        --     { model | mustardSeed = n }


brew : Model -> Model
brew model =
  let number = (model.rosemary ^ 2) + (model.thyme ^ 2)
      effect = if 33 > number then Heal 5
                  else if 66 > number && number >= 33 then  Energize 5
                  else Poison 5

  in
    { model | result = Just (effect) }
