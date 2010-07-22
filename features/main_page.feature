Feature: The homepage
  In order to visit the site and see what it's about
  As a user
  I want to be able to go to the base URL and see stuff

  Scenario: Viewing the homepage
    Given I am a user
    When I go to the homepage
    Then I should see "Login"
