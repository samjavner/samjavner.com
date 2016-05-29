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
  Page.sbcView
    [ div [ style [ ("text-align", "center") ] ]
      [ h1 [] [ text "Silver Bullet Cookbook" ]
      , p [] [ text "Recipe management and meal planning made easy!" ]
      ]
    ]
    [ featuresView
    , a [ class "pure-button", href "/static/sbc/downloads/SilverBulletCookbook-1.1.1.exe" ] [ text "Download Silver Bullet Cookbook" ]
    ]


featuresView : Html a
featuresView =
  Markdown.toHtml [] features


features : String
features = """

# Download

Silver Bullet Cookbook requires **Windows XP** (Service Pack 3), **Windows Vista** (Service Pack 1), **Windows 7**,
**Windows 8**, or **Windows 10**. Silver Bullet Cookbook will automatically install the .NET Framework 4.0 Client Profile
on your machine if it is not already installed.

"""