Given /^I am a user$/ do
  # This step doesn't need to do anything right now
end

Then /^there should be a new user$/ do
  assert User.first
end

Then /^there should be a user with the name "([^"]*)"$/ do |name|
  assert User.find_by_name(name)
end

Then /^there should be a user with the twitter handle "([^"]*)"$/ do |twitter_handle|
  assert User.find_by_twitter_handle(twitter_handle)
end

Given /^I am logged in$/ do
  steps %Q{
    When  I go to the login page
    And   I follow "Login with Twitter"
    And   twitter authentication is successful
  }
end
