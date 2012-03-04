Given /^there is a citation called "([^\"]*)"( with title "[^\"]*")?$/ do |citekey, title|
  if title.nil?
    @citation = FactoryGirl.create(:citation, :citekey => citekey)
  else
    @citation = FactoryGirl.create(:citation, :citekey => citekey, :title => title)
  end
end

Given /^"([^\"]*)" has an author named "([^\"]*)"$/ do |citekey, author_name|
  @citation = Citation.find_by_citekey(citekey)
  a = Author.find_by_name(author_name) || Author.create(:name => author_name)
  @citation.authors << a
end
