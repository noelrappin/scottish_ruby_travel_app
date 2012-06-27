Feature: User Preferences

  Scenario: User Preference display
    Given I am a logged in user
    When I go to my profile page
    Then I see my current preferences

  Scenario: User Preference edit
    Given I am a logged in user
    When I go to edit my profile
    And I enter new preferences
    Then my preferences are updated