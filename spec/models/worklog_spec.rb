require 'spec_helper'

describe Worklog do
  describe 'timeperiod' do
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

  end
end
