Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Login"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end

Given /^I am signed in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end

When /^I sign out$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Logout"
    Then I should see "Signed out successfully."
  })
end

When /^I sign in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end

