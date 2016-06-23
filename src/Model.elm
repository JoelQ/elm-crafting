module Model
    exposing
        ( PotionEffect(..)
        , Plant(..)
        , Ingredient
        , Model
        , initialModel
        )


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
