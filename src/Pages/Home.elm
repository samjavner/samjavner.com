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
      [ h1 [] [ text "Software Developer" ]
      ]
    ]
    [ Markdown.toHtml [] homeText
    ]


homeText : String
homeText = """

# About Me

![photograph of me](/static/me.jpg)

I enjoy making software simpler, more maintanable, and more usable. I am happy
when I am learning new things, building new things, and teaching others.

Aside from software development I love cooking, listening to music, reading
nonfiction, playing games, and spending time outdoors.

On this site you will find links to my GitHub and LinkedIn accounts, as well as
samples of some of the projects I have spent my time working on and playing around
with.

"""