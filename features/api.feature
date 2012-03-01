Feature: API
  The API should allow people to submit citation info, scrobbles, and links to personal wiki pages.

  Background:
    Given there are the following users:
      | email             | name | password | 
      | user1@example.com | user | password |

  Scenario: Submitting a citation
    When I submit the citation "@article{tversky1974judgment, Author = {Tversky, A. and Kahneman, D.}, Journal = {Science}, Keywords = {cognition; biases}, Number = {4157}, Pages = {1124}, Title = {Judgment under uncertainty: Heuristics and biases}, Volume = {185}, Year = {1974}}"
    And I am on the citation index page
    Then I should see "tversky1974judgment"
    When I am on the citation page for "tversky1974judgment"
    Then I should see "Judgment under uncertainty" within "h1"
    And I should see "Tversky, A." within "#authors"
    And I should see "cognition" within "#tags"


  Scenario: Submitting a scrobble
    Given there is a citation called "tversky1974judgment"
    When I submit a scrobble for "tversky1974judgment"
    And I am on the homepage
    Then I should see "tversky1974judgment"
    
  Scenario: Submitting a wiki page
    Given there is a citation called "tversky1974judgment"
    When I submit a link to "tversky1974judgment"
    And I am on the citation page for "tversky1974judgment"
    Then I should see "user" within "#ref_links"

