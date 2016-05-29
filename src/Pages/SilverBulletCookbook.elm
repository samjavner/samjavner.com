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
      [ img [ src "/static/sbc/images/01_700.png" ] []
      , p [] [ text "Recipe management and meal planning made easy!" ]
      ]
    ]
    [ featuresView
    ]


featuresView : Html a
featuresView =
  Markdown.toHtml [] features


features : String
features = """

# Silver Bullet Cookbook

*Silver Bullet Cookbook* is the easiest way to **organize** and **print recipes** and **plan meals**. With other recipe
software typing and editing recipes can feel like a chore, but *Silver Bullet Cookbook*'s **simple** and **straightforward**
recipe editng screen makes entering recipes a breeze. *Silver Bullet Cookbook* makes it easy to add a splash of **color**
and **style** to your recipes - both while viewing and printing your recipes, and unlike some other software
*Silver Bullet Cookbook* shows you **thumbnails** of all your beautiful recipe **photos**. And with the handy Meal Planner
always at your fingertips, planning meals has never been easier!

# Manage Recipes

*Silver Bullet Cookbook* shows you a list of your recipes with thumbnails side-by-side with the recipe text and photos.
Use the **search** feature to find recipes by category, source, text, or ingredients. Easily perform a search with multiple
criteria. Mark recipes as recipes you want to **try soon**, recipes you have **prepared**, or recipes that are **favorites**.
These icons show up next to your recipes in the recipe list, and you can use the search feature to quickly and easily
find those recipes.

# Plan Meals

Add recipes to the calendar with **one click**! View and plan meals for an entire **week at a time**.

# Add and Edit Recipes

With other recipe software typing in ingredients can feel like working with a spreadsheet and you may find yourself
switching between dozens of tabs to find where to enter your recipe details. With *Silver Bullet Cookbook* the **Recipe**
tab makes it easy to type in the recipe name, description, ingredients, directions, variations, and notes. The
**Details** tab allows you to enter the recipe details: cookbook, source, author, website, web address, servings,
yield, times, and categories. The **Photos** tab allows you to add and arrange beautiful photos of your recipe.
Finally, the **Capture** tab makes it easy add recipes from the Internet or other documents.

# Categorize Recipes

Categorize your recipes by **course**, **dish**, **cuisine**, **dietary consideration**, **equipment**, **technique**,
**occasion**, or other categories such as "**make ahead**," "**one dish**," and "**quick and easy**." Later, you can
search for your recipes by category. Rather than displaying all your categories in one very long list,
*Silver Bullet Cookbook* breaks down your categories into sub-categories. When you search for recipes in a category,
*Silver Bullet Cookbook* is **smart** enough to display recipes from all the sub-categories. For example, a search
for desserts will find recipes categorized as cake, cookie, or pie. A search for European recipes will find recipes
categorized as French, Italian, or Greek. You can also add your own custom user categories.

# Print Recipes

Print recipes to **any size paper** supported by your printer, including index cards. The **preview** shows you exactly
what your recipe will look like printed and lets you adjust page margins and decide which recipe elements to print.
Use any of the color schemes or styles included with *Silver Bullet Cookbook* or create your own in order to
**personalize** your printed recipes.

# Import Recipes

Import recipes that have been saved to either the Meal-Master (.mmf) or MasterCook (.mx2) format by other recipe software.
Large collection of recipes? No problem! *Silver Bullet Cookbook*'s recipe import is **fast** and **powerful** enough that
it can store more than 100,000 recipes while still being able to quickly search for that perfect recipe. The only limits
are the amount of storage and memory on your computer.

# Customize

Use **color schemes** and **styles** to customize the recipe display. Use larger fonts when you want to see from across
the room and smaller fonts to fit your recipe onto an index card perfectly. Add a splash of color to your printed recipes
 or easily display your recipes with a high-contrast color scheme.

You can easily set up *Silver Bullet Cookbook* to display **ingredient units** (cups, tablespoons, etc.) in full or using
abbreviations (c., T., tbsp., etc.) of your choosing. You can also customize the display of **times** ("2 hours 5 minutes"
or "2 hr 5 min" or "2:05").

"""