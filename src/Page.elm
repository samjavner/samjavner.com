module Page exposing
  ( view
  , sbcView
  )


import Html exposing (..)
import Html.Attributes exposing (..)


view : List (Html a) -> List (Html a) -> Html a
view =
  customView "/projects" "Sam Javner"
    [ li [ class "pure-menu-item pure-menu-selected" ]
      [ a [ class "pure-menu-link", href "/projects" ] [ i [ class "fa fa-folder-open" ] [], text "Projects" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "https://github.com/samjavner" ] [ i [ class "fa fa-github" ] [], text "GitHub" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "https://www.linkedin.com/in/samjavner" ] [ i [ class "fa fa-linkedin" ] [], text "LinkedIn" ] ]
    ]


sbcView : List (Html a) -> List (Html a) -> Html a
sbcView =
  customView "/silverbulletcookbook" "Silver Bullet Cookbook"
    [ li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "/silverbulletcookbook/download" ] [ i [ class "fa fa-download" ] [], text "Download Now!" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "http://pinterest.com/sbcookbook/" ] [ i [ class "fa fa-pinterest" ] [], text "Pinterest" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "/projects" ] [ i [ class "fa fa-folder-open" ] [], text "Sam Javner" ] ]
    ]


customView : String -> String -> List (Html a) -> List (Html a) -> List (Html a) -> Html a
customView headingHref headingText links headerContent pageContent =
  div []
    [ navbarView headingHref headingText links
    , div [ class "page-wrapper", style [ ( "margin-top", (toString (75 + ((List.length links) * 35))) ++ "px" ) ] ]
      [ div [ class "page-header" ]
        [ div [ class "page-header-wrapper" ]
          headerContent
        ]
      , div [ class "page-content-wrapper" ]
        [ div [ class "page-content" ]
          pageContent
        ]
      ]
    , footerView
    ]


navbarView : String -> String -> List (Html a) -> Html a
navbarView headingHref headingText links =
  div [ class "navbar-wrapper" ]
    [ div [ class "pure-menu pure-menu-horizontal navbar" ]
      [ a [ class "pure-menu-heading pure-menu-link", href headingHref ]
        [ text headingText
        ]
      , ul [ class "pure-menu-list" ] links
      ]
    ]


footerView : Html a
footerView =
  div [ class "footer" ]
    [ text "© 2016 Sam Javner"
    ]