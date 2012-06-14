When /^I go to the home page$/ do
  visit root_path
end

Then /^I do not see purchase information$/ do
  page.should_not have_selector(
      "#trip_#{$TRIPS[:mayflower].id} .purchase_info .purchased")
end

Given /^I am a logged in user$/ do
  @user = $USERS[:fred]
  visit new_user_session_path
  fill_in("user_email", :with => @user.email)
  fill_in("user_password", :with => @user.password)
  click_button("Sign in")
end

Given /^I have purchased some trips$/ do
  Purchase.create(:buyer => @user, :purchasable => $TRIPS[:mayflower])
end

Then /^I see my purchase status on each trip$/ do
  page.should have_selector(
      "#trip_#{$TRIPS[:mayflower].id} .purchase_info .purchased")
  page.should_not have_selector(
      "#trip_#{$TRIPS[:mayflower].id} .purchase_info .unpurchased")
  page.should_not have_selector(
      "#trip_#{$TRIPS[:shakespeare].id} .purchase_info .purchased")
  page.should have_selector(
      "#trip_#{$TRIPS[:shakespeare].id} .purchase_info .unpurchased")
end