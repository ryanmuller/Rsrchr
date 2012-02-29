Feature: Adding tags
  Users should be able to tag citations

  Background:
    Given there are the following users:
      | email             | password |
      | user1@example.com | password |
      | user2@example.com | password |
    And I am signed in as "user1@example.com"
    And there is a citation called "tversky1974judgment"
    And I am on the citation page for "tversky1974judgment"

  Scenario: Adding a tag to a citation
    When I add a tag called "cognition" within "#new_tag"
    Then I should see "Tag created successfully."
    And I should see "cognition" within "#tags"

  Scenario: Adding the same tag twice
    When I add a tag called "cognition" within "#new_tag"
    And I add a tag called "cognition" within "#new_tag"
    Then I should not see "Tag created successfully."

  Scenario: Two users adding the same tag
    When I add a tag called "cognition" within "#new_tag"
    And I sign out
    And I sign in as "user2@example.com"
    And I am on the citation page for "tversky1974judgment"
    And I add a tag called "cognition" within "#new_tag"
    Then I should see "cognition (2)" within "#tags"

  Scenario: Viewing citations for a tag
    When I add a tag called "cognition" within "#new_tag"
    And I am on the tag page for "cognition"
    Then I should see "tversky1974judgment"
  
