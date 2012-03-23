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
  describe 'valid_weeks_within_a_range(' do
    let(:user1) { Factory :user }
    let(:user2) { Factory :user }
    let!(:worklog1) { Worklog.create(:time_period => Date.parse('05 Mar 2012'), :user =>user1) }
    let!(:worklog2) { Worklog.create(:time_period => Date.parse('19 Mar 2012'), :user =>user2) }

    it'returns an array of un-filed mondays for a user within date1 and date2' do
      startdate = Date.parse('1 Mar 2012')
      enddate = Date.parse('31 Mar 2012')
      user1.valid_weeks_within_a_range(startdate,enddate).should == [Date.parse('Mon, 27 Feb 2012'),Date.parse('Mon, 12 Mar 2012'),Date.parse('Mon, 19 Mar 2012'),Date.parse('Mon, 26 Mar 2012')]
    end

    it 'should return only one monday when the start and enddates fall in the same week' do
      startdate = Date.parse('29 Feb 2012')
      enddate = startdate + 3
      user1.valid_weeks_within_a_range(startdate,enddate).count.should == 1
    end
  end
end
