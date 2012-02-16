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
  fill_in 'Filed on', with:Time.now
  click_button 'Create Worklog'

end
