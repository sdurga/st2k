FactoryGirl.define do
  factory :worklog do
     user
     concerns "description"
     work_progress_this_week "description of work"
    time_period Date.parse('Mon, 9 Apr, 2012')
  end
end
