Given /^That I am logged in$/ do
  @user = Factory :user
 
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
  end

And /^I visit the worklogs page$/ do
 visit new_worklog_path
end


Then /^I should be able to create and save new worklogs$/ do
  fill_in 'Who', with: 'Name'
  fill_in 'Work progress this week', with: 'work this week'
  fill_in 'Concerns', with: 'concerns'
  select('Time period',with:'')
  click_button 'Create Worklog'

end

Given /^I am logged in$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I create and save a new worklog$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^The last worklog listed should be my me$/ do
  pending # express the regexp above with the code you wish you had
end

