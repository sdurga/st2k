require 'spec_helper'
require 'date'

describe Meeting do
  describe 'proposed_date_for_meeting' do
    let(:user) {Factory :user }
    let(:meeting) {Meeting.new }

    it 'should be required' do
      meeting.should_not be_valid
    end

    it 'sets the error message when not present' do
      meeting.errors_on(:proposed_date_for_meeting).should == ["can't be blank"]
    end
    it 'cannot be a past date' do
        meeting.proposed_date_for_meeting = DateTime.parse('20 Mar 2012 11:30AM')
        meeting.valid?
      meeting.errors_on(:proposed_date_for_meeting).should == ["cannot schedule meeting for a past date"]
    end
  end
 end
