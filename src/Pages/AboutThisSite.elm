import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown


import Page


main : Program Never Model Msg
main =
  beginnerProgram { model = init, update = update, view = view }


type alias Model =
  {
  }


init : Model
init =
  {
  }


type Msg
  = Pass


update : Msg -> Model -> Model
update msg model =
  model


view : Model -> Html Msg
view model =
  Page.view
    [ div [ style [ ("text-align", "center") ] ]
      [ h1 [] [ text "About this site" ]
      ]
    ]
    [ Markdown.toHtml [] aboutText
    ]


aboutText : String
aboutText = """

The site is written in [Elm](http://elm-lang.org/) using [Pure](http://purecss.io/).
The site is hosted with [Google App Engine](https://cloud.google.com/appengine/) with
some [Python](https://www.python.org/) to handle the routing.

The source code for this site is available on [GitHub](https://github.com/samjavner/samjavner.com).

"""