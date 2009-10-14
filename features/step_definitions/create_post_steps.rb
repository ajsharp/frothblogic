Then /^I should have a valid post with title "(.+)"$/ do |title|
  Post.find_by_title(title).should_not be_nil
end
