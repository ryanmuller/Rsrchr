Given /^there is a group called "([^"]*)"$/ do |name|
  @group = FactoryGirl.create(:group, :name => name)
end

When /^I submit the posting "([^"]*)"$/ do |content|
  step "I fill in \"posting_content\" with \"#{content}\""
  step "I press \"Post\""
end

