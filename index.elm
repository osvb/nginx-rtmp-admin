import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }


type alias Model =
  { name : String
  , url : Array
  }


model : Model
model = 
  Model "" []


-- UPDATE


type Msg
    = Name String
    | url Array<URL>


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Array<url> url ->
      { model | url = url }


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "text", placeholder "url", onInput Password ] []
    , viewValidation model
    ]


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.name && model.url then
        ("green", "OK")
      else
        ("red", "Feltene må fylles ut!")
  in
    div [ style [("color", color)] ] [ text message ]
