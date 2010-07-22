Feature: Registering and logging in
  In order to login and use the site
  As a user
  I want to be able to register for an account and sign in

  Scenario: Viewing the login page
    Given I am a user
    When  I go to the homepage
    And   I follow "Login"
    Then  I should see "Login with Twitter"

  @wip
  Scenario: Getting redirected to twitter when attempting to login with twitter
    Given I am a user
    When  I go to the login page
    And   I follow "Login with Twitter"
    Then  I should be on the twitter auth page

  @wip
  Scenario: Registering a user via twitter
    Given I am a user
    When  I go to the login page
    And   I follow "Login with Twitter"
    And   twitter authentication is successful
    Then  I should be redirected to the homepage
    And   I should not see "Login"
    And   I should see "Logout"
    And   there should be a new user created for me

  @wip
  Scenario: Logging in with twitter after already registering
    Given I am an existing user authenticated with the twitter username "nerdEd"
    When  I go to the login page
    And   I follow "Login with Twitter"
    And   twitter authentication is successful
    Then  I should be redirected to the homepage
    And   I shjould not see "Login"
    And   I should not see "Logout"
    And   the number of users in the system should not change
