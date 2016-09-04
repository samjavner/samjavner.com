import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (on, onClick, targetValue)


import Page


main : Program Never
main =
  App.beginnerProgram { model = init, update = update, view = view }


type alias Project =
  { name : String
  , projectTypes : List ProjectType
  , url : String
  , imageUrl : String
  }


type ProjectType
  = DotNet
  | CSharp
  | Css
  | ElmLang
  | Html5
  | Python
  | SQLite
  | UniversalWindows
  | VBNet
  | Wpf
  | Xaml


projectTypeString : ProjectType -> String
projectTypeString projectType = 
  case projectType of
    DotNet ->
      ".NET"
    
    CSharp ->
      "C#"
    
    Css ->
      "CSS"
    
    ElmLang ->
      "Elm"
    
    Html5 ->
      "HTML5"
    
    Python ->
      "Python"
    
    SQLite ->
      "SQLite"
    
    UniversalWindows ->
      "Universal Windows"
    
    VBNet ->
      "VB.NET"
        
    Wpf ->
      "WPF"
      
    Xaml ->
      "XAML"


type alias Model =
  { projectTypes : List ProjectType
  , projectTypeFilter : Maybe ProjectType
  , projects : List Project
  }


init : Model
init =
  { projectTypes = projectTypes
  , projectTypeFilter = Nothing
  , projects = projects
  }


projectTypes : List ProjectType
projectTypes =
  [ DotNet, CSharp, Css, ElmLang, Html5, Python, SQLite, UniversalWindows, VBNet, Wpf, Xaml ]


projects : List Project
projects =
  [ { name = "Silver Bullet Cookbook"
    , projectTypes = [ VBNet, CSharp, DotNet, Wpf, Xaml, SQLite ]
    , url = "/silverbulletcookbook/"
    , imageUrl = "silver-bullet-cookbook.png"
    }
  , { name = "SamJavner.com"
    , projectTypes = [ Html5, Css, ElmLang ]
    , url = "https://github.com/samjavner/samjavner.com"
    , imageUrl = "sam-javner.png"
    }
  , { name = "Voice Unit Converter"
    , projectTypes = [ CSharp, DotNet, UniversalWindows, Xaml ]
    , url = "https://github.com/samjavner/voice-unit-converter"
    , imageUrl = "voice-unit-converter.png"
    }
  , { name = "Recipe Formats"
    , projectTypes = [ Python ]
    , url = "https://github.com/samjavner/recipeformats"
    , imageUrl = "recipe-formats.png"
    }  
  ]


type Msg
  = SelectFilter (Maybe ProjectType)


update : Msg -> Model -> Model
update msg model =
  case msg of
    SelectFilter newprojectTypeFilter ->
      { model | projectTypeFilter = newprojectTypeFilter }


view : Model -> Html Msg
view model =
  Page.view
    [ div [ style [ ("text-align", "center") ] ]
      [ h1 [] [ text "Projects" ]
      , p [] [ text "Here are some of the projects I have spent time on over the years." ]
      ]
    ]
    [ projectTypesView model
    , projectsView model
    ]


projectTypesView : Model -> Html Msg
projectTypesView model =
  let
    showAllButtonClass =
      case model.projectTypeFilter of
        Nothing ->
          "pure-button button-filter-none pure-button-active"
        
        _ ->
          "pure-button button-filter-none"
  
    showAllButton =
      button [ class showAllButtonClass, onClick (SelectFilter Nothing) ] 
      [ i [ class "fa fa-filter" ] []
      , text "Show All"
      ]
    
    projectTypeButtons =
      List.map (projectTypeButton model.projectTypeFilter) model.projectTypes
  
  in
    div [ class "project-type-filters" ] (showAllButton :: projectTypeButtons)


projectTypeButton : Maybe ProjectType -> ProjectType -> Html Msg
projectTypeButton maybeProjectTypeFilter projectType =
  let
    buttonClass =
      case maybeProjectTypeFilter of
        Nothing ->
          "pure-button button-filter"
        
        Just projectTypeFilter ->
          if projectTypeFilter == projectType then
            "pure-button button-filter pure-button-active"
          
          else
            "pure-button button-filter"
  
  in
    button [ class buttonClass, onClick (SelectFilter (Just projectType)) ] [ text (projectTypeString projectType) ]


projectsView : Model -> Html a
projectsView model =
  div [ class "project-container" ] (List.map projectView (filterProjects model))


projectView : Project -> Html a
projectView project =
  div [ class "pure-u-1-2 pure-u-sm-1-3 pure-u-md-1-4 project-badge" ]
    [ div [ class "project-badge-content" ]
      [ a [ href project.url ]
        [ img [ src ("/static/projects/images/" ++ project.imageUrl) ] []
        , h5 [] [ text project.name ]
        ]
      ]
    ]


filterProjects : Model -> List Project
filterProjects model =
  case model.projectTypeFilter of
    Just projectTypeFilter ->
      List.filter (\project -> List.member projectTypeFilter project.projectTypes) model.projects
    
    Nothing ->
      model.projects