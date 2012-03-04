Feature: User


  Background:
    Given there are the following users:
      | email             | name | password | 
      | user1@example.com | user | password |
    And I am signed in as "user1@example.com"
    And there is a citation called "tversky1974judgment" with title "Judgment Under Uncertainty"

  Scenario: Submitting a citation
    When I submit the citation "@article{tversky1974judgment, Author = {Tversky, A. and Kahneman, D.}, Journal = {Science}, Keywords = {cognition; biases}, Number = {4157}, Pages = {1124}, Title = {Judgment under uncertainty: Heuristics and biases}, Volume = {185}, Year = {1974}}"
    And I am on the user page for "user"
    Then I should see "Judgment Under Uncertainty" within "#library"
