module Page exposing
  ( view
  , sbcView
  )


import Html exposing (..)
import Html.Attributes exposing (..)


view : List (Html a) -> List (Html a) -> Html a
view =
  customView navbarView


sbcView : List (Html a) -> List (Html a) -> Html a
sbcView =
  customView sbcNavbarView


customView : Html a -> List (Html a) -> List (Html a) -> Html a
customView navbar headerContent pageContent =
  div []
    [ navbar
    , div [ class "page-wrapper" ]
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


navbarView : Html a
navbarView =
  customNavbarView "/projects" "Sam Javner"
    [ li [ class "pure-menu-item pure-menu-selected" ]
      [ a [ class "pure-menu-link", href "/projects" ] [ i [ class "fa fa-folder-open" ] [], text "Projects" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "https://github.com/samjavner" ] [ i [ class "fa fa-github" ] [], text "GitHub" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "https://www.linkedin.com/in/samjavner" ] [ i [ class "fa fa-linkedin" ] [], text "LinkedIn" ] ]
    ]


sbcNavbarView : Html a
sbcNavbarView =
  customNavbarView "/silverbulletcookbook" "Silver Bullet Cookbook"
    [ li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "/silverbulletcookbook/download" ] [ i [ class "fa fa-download" ] [], text "Download Now!" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "http://pinterest.com/sbcookbook/" ] [ i [ class "fa fa-pinterest" ] [], text "Pinterest" ] ]
    , li [ class "pure-menu-item" ]
      [ a [ class "pure-menu-link", href "/projects" ] [ i [ class "fa fa-folder-open" ] [], text "Sam Javner" ] ]
    ]


customNavbarView : String -> String -> List (Html a) -> Html a
customNavbarView headingHref headingText links =
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