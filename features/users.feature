Feature: Registering and logging in
  In order to login and use the site
  As a user
  I want to be able to register for an account and sign in

  Scenario: Viewing the login page
    Given I am a user
    When  I go to the homepage
    And   I follow "Login"
    Then  I should be on the login page

  Scenario: Being redirected to twitter for authorization
    Given I am a user
    When  I go to the login page
    And   I follow "Login with Twitter"
    Then  I should be on the twitter authentication page

  Scenario: Registering a user via twitter
    Given I am a user
    When  I go to the login page
    And   I follow "Login with Twitter"
    And   twitter authentication is successful
    Then  I should be on the homepage
    And   there should be a new user
    And   there should be a user with the name "Ed Schmalzle"
    And   there should be a user with the twitter handle "nerded"
    And   I should not see "Login"
    And   I should see "Logout"

  Scenario: Logging out
    Given I am logged in
    When  I go to the homepage
    And   I follow "Logout"
    Then  I should be on the homepage
    And   I should see "Login"
