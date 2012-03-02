require 'spec_helper'
require 'date'

describe Worklog do
  describe 'time_period' do
    let(:user) {Factory :user }
    let(:worklog) {Worklog.new }

    it 'should be required' do
     worklog.should_not be_valid
    end

    it 'sets the error message when not present' do
      worklog.errors_on(:time_period).should == ["can't be blank"]
    end

    it 'sets error message if time_period is not beginning of week'do
      worklog.time_period = Date.today.beginning_of_week + 1.day
      worklog.valid?
      worklog.errors_on(:time_period).should == ["should be beginning of week"]
    end

    it 'is valid if date is beginning of week'do
      worklog.time_period = Date.today.beginning_of_week
      worklog.valid?
      worklog.errors_on(:time_period).should be_empty
    end

    it 'should be unique per user'do
     worklog1 = Worklog.new(:time_period => Date.parse('2012-2-27'), :user =>user)
     worklog1.save!
     worklog2 = Worklog.create(:time_period => Date.parse('2012-2-27'), :user =>user)
     worklog2.valid?
     worklog2.errors_on(:time_period).should == ["worklog saved for this time period"]
    end
  end
  describe 'mondays_in_a_date_range' do
    it'returns an array of mondays within date1 and date2' do
      startdate = Date.parse('1 Jan 2012')
      enddate = startdate + 8
      Worklog.mondays_in_a_date_range(startdate,enddate).should == [Date.parse('Mon, 02 Jan 2012'), Date.parse('Mon, 09 Jan 2012')]
    end
    it 'should return an empty array when no mondays are present' do
      startdate = Date.parse('29 Feb 2012')
      enddate = startdate + 3
      Worklog.mondays_in_a_date_range(startdate,enddate).should be_empty
    end
  end
  describe 'worklog time period for a user' do
    it'should disply only dates that hav not been already filled for' do
      startdate = Date.parse('1 Jan 2012')
      enddate = startdate + 8
      datearr = Worklog.mondays_in_a_date_range(startdate,enddate)
      User.worklog_time_period(datearr).should be_empty
    end
  end
end
