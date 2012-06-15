Feature: The ability to view and purchase a page with options

  Scenario: I can see a trip and its details
    Given I am a logged in user
    When I go to a trip page
    And I select a length of stay
    And I select a hotel
    And I select extras
    And I buy the trip
    Then I see the correct purchase listed
    And I see the correct price