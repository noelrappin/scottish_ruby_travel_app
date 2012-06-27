When /^I go to the friend page$/ do
  visit users_path
end

Then /^I see an option to remove my current friends$/ do
  page.should have_selector("#user_#{$USERS[:barney].id} .remove")
end

Then /^I see an option to add new friends$/ do
  page.should have_selector("#user_#{$USERS[:wilma].id} .add")
end

When /^I add a friend$/ do
  visit users_path
  click_link("Add Friend")
end

Then /^I see that the friend has been added$/ do
  page.should have_selector("#user_#{$USERS[:wilma].id} .remove")
end
 
Given /^I have a friend$/ do
  @user.extend(Roles::Friend).befriend($USERS[:wilma])
end

When /^I remove a friend$/ do
  visit users_path
  click_link("Remove Friend")
end

Then /^I see that the friend has been removed$/ do
  page.should have_selector("#user_#{$USERS[:wilma].id} .add")
end

