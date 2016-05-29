import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Markdown


import Page


main : Program Never
main =
  App.beginnerProgram { model = init, update = update, view = view }


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

During the day you will find me at MSI Data in Mequon, WI building web applications
and APIs using JavaScript, C#, and SQL Server. I enjoy trying to make software
simpler, more maintanable, and more usable. I am happy when I am learning new things,
building new things, and teaching others.

Aside from software development I love cooking, listening to music, reading
nonfiction, playing games, and spending time outdoors.

On this site you will find links to my GitHub and LinkedIn accounts, as well as
samples of some of the projects I have spent my time working on and playing around
with.

"""