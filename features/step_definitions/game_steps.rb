Then /^I should see a "([^"]*)" button$/ do |text|
  response.body.should have_tag("input[type='submit'][value='#{text}']")
end

Then /^I should see a game form$/ do
  response.body.should have_tag('form#new_game')
end

Then /^the form should have the following moves:$/ do |table|
  table.hashes.each do |hash|
    response.body.should have_tag('form#new_game') do
      with_tag("input[type=radio][value='#{hash[:move]}']")
    end
  end
end

Then /^I should see the followings error: "([^"]*)"$/ do |text|
  response.body.should have_tag('div#errorExplanation') do
    with_tag('li',:text => text)
  end
end

Then /^I should see the game result$/ do
  response.body.should have_tag('.result')
end

Then /^I should see my choice$/ do
  response.body.should have_tag('.players_hand span', :text => 'Rock')
end

Then /^I should see the computers choice$/ do
  response.body.should have_tag('.computers_hand span', :text => /Rock|Paper|Scissors/)
end