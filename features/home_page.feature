Feature: Purchasing a trip
  
  Scenario: A non logged in user does not see buy information on the home screen
    When I go to the home page
    Then I do not see purchase information

  Scenario: A logged in user sees purchase history on main page
    Given I am a logged in user 
    And I have purchased some trips
    When I go to the home page
    Then I see my purchase status on each trip