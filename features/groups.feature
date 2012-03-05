Feature: Groups
  Users should be able to join groups and make and view postings for groups

  Background: 
    Given there are the following users:
      | name | email             | password |
      | user | user1@example.com | password |
    And I am signed in as "user1@example.com"
    And there is a group called "Vikings"

  Scenario: Viewing a group
    When I am on the group index page
    Then I should see "Vikings"

  Scenario: Joining a group
    When I am on the group index page
    And I follow "Vikings"
    And I press "Join"
    Then I should see "You are a member of this group"

  Scenario: Making a posting
    When I am on the group page for "Vikings"
    And I press "Join"
    And I submit the posting "Hi everyone"
    Then I should see "Hi everyone" within "#postings"

