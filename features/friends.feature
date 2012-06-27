Feature: Friends

  Scenario: Viewing Friends
    Given I am a logged in user
    When I go to the friend page
    Then I see an option to remove my current friends
    And I see an option to add new friends

  Scenario: Adding a friend
    Given I am a logged in user
    When I add a friend
    Then I see that the friend has been added

  Scenario: Removing a friend
    Given I am a logged in user
    And I have a friend
    When I remove a friend
    Then I see that the friend has been removed