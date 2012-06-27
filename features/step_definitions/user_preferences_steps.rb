When /^I go to my profile page$/ do
  visit user_path(@user)
end

Then /^I see my current preferences$/ do
  page.should have_selector("#preferences")
end

When /^I go to edit my profile$/ do
  visit edit_user_path(@user)
end

When /^I enter new preferences$/ do
  check("century_5")
  check("area_Europe")
  check("activity_War")
  click_button("Submit")
end

Then /^my preferences are updated$/ do
  page.should have_selector(".preference", :count => 3)
  page.should have_selector("#century_5")
  page.should have_selector("#area_Europe")
  page.should have_selector("#activity_War")
end