Feature: reviews

  @javascript
  Scenario: Create an invalid Review
    Given I am a guest
    And there is a Recipe
    When I visit the Recipe
    And I create an invalid review
    Then I should see the review error message
