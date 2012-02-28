Feature: Adding tags
  Users should be able to tag citations

  Background:
    Given there is a citation called "tversky1974judgment"
    And I am on the citation page for "tversky1974judgment"

  Scenario: Adding a tag to a citation
    When I add a tag called "cognition" within "#new_tag"
    Then I should see "Tag created successfully."
    And I should see "cognition" within "#tags"

  Scenario: Viewing citations for a tag
    When I add a tag called "cognition" within "#new_tag"
    And I am on the tag page for "cognition"
    Then I should see "tversky1974judgment"
  
