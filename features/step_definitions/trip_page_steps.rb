When /^I go to a trip page$/ do
  visit trip_path($TRIPS[:mayflower])
end

When /^I select a length of stay$/ do
  select("3", :from => "purchase_length_of_stay")
end

When /^I select a hotel$/ do
  select("Standard Room: Just a room with a tiny view. ($300.00)", :from => "purchase_lodging")
end

When /^I select extras$/ do
  check("Martha's Vineyard ($400.00)")
end

When /^I buy the trip$/ do
  click_button("Order") 
end

Then /^I see the correct purchase listed$/ do
  page.should have_selector(".trip_name", :text => /Mayflower/)
  page.should have_selector(".hotel_name", :text => /Standard/)
  page.should have_selector(".hotel_price", :text => /3 nights/)
  page.should have_selector(".extras", :text => /Vineyard/)
end

Then /^I see the correct price$/ do
  page.should have_selector(".total_cost", :text => "$1,300.00")
end