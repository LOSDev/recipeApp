Feature: Recipes

  @javascript
  Scenario: Home Page
    Given I am a guest
    And there are 2 Recipes
    When I visit the home page
    Then I should see 2 Recipes

  @javascript
  Scenario: Create Recipe
    Given I am a logged in user
    When I create a new Recipe
    Then I should see the new Recipe

  @javascript
  Scenario: Show Recipe
    Given I am a guest
    When I look at a recipe
    Then I should see the Recipe

  @javascript
  Scenario: Edit Recipe
    Given I am a logged in user
    When edit a recipe
    Then I should see the new recipe data

  @javascript
  Scenario: Delete Recipe
    Given I am a logged in user
    When I delete a recipe
    Then I should not see the recipe title
