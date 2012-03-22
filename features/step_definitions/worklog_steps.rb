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
  #save_and_open_page
  fill_in 'Who', with: 'Name'
  fill_in 'Work progress this week', with: 'work this week'
  fill_in 'Concerns', with: 'concerns'
  select('Week of 2012-03-19',from:'Time period')
  click_button 'Create Worklog'
  current_path = URI.parse(current_url).path
  current_path.should == worklog_path(Worklog.last.id)
end

Given /^I create a new worklog$/ do
  visit new_worklog_path
  fill_in 'Who', with: 'Name'
  fill_in 'Work progress this week', with: 'work this week'
  fill_in 'Concerns', with: 'concerns'
  select('Week of 2012-03-19',from:'Time period')
  click_button 'Create Worklog'
  end

Then /^The last worklog in the database should be saved by me$/ do
 w = Worklog.last
 w.user_id.should == @user.id
 w.who.should == 'Name'
 w.time_period.should == Date.parse('Mon, 19 Mar 2012')
 w.work_progress_this_week.should == 'work this week'
 w.concerns.should == 'concerns'
end



