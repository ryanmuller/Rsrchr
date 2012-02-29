Feature: Authors
  Authors should be listed for a citation. Author pages should list the author's bibliography.


  Background:
    Given there are the following users:
      | email             | password |
      | user1@example.com | password |
    And I am signed in as "user1@example.com"
    And there is a citation called "tversky1974judgment"
    And "tversky1974judgment" has an author named "Tversky, Amos"
    And "tversky1974judgment" has an author named "Kahneman, Daniel"

  Scenario: Viewing the citation
    When I am on the citation page for "tversky1974judgment"
    Then I should see "Tversky, Amos" within "#authors"
    And I should see "Kahneman, Daniel" within "#authors"

  Scenario: Viewing the author page
    When I am on the author page for "Tversky, Amos"
    Then I should see "tversky1974judgment" within "#bibliography"
    

