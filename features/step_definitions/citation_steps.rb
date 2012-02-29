Given /^there is a citation called "([^\"]*)"$/ do |citekey|
  @citation = FactoryGirl.create(:citation, :citekey => citekey)
end

Given /^"([^\"]*)" has an author named "([^\"]*)"$/ do |citekey, author_name|
  @citation = Citation.find_by_citekey(citekey)
  a = Author.find_by_name(author_name) || Author.create(:name => author_name)
  @citation.authors << a
end
