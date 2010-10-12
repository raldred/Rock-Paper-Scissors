Then /^I should see a "([^"]*)" button$/ do |text|
  response.body.should have_tag("input[type='submit'][value='#{text}']")
end