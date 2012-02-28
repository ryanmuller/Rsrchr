When /^I add a tag called "([^\"]*)"$/ do |tag_name|
  fill_in("tag_name", :with => tag_name)
  click_button("Add tag")
end
  
