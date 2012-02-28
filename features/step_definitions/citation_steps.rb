Given /^there is a citation called "([^\"]*)"$/ do |citekey|
  @citation = FactoryGirl.create(:citation, :citekey => citekey)
end
