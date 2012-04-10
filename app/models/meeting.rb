class Meeting < ActiveRecord::Base
belongs_to :user
validates_presence_of :proposed_date_for_meeting
validates :proposed_date_for_meeting, :uniqueness => {:scope => :user_id, :message=> "meeting already scheduled for this time"}
validate :past_dates_cannot_be_scheduled_for
  def past_dates_cannot_be_scheduled_for
    if !proposed_date_for_meeting.nil?
      if proposed_date_for_meeting.past?
        errors.add(:proposed_date_for_meeting,"cannot schedule meeting for a past date")
      end
    end
  end
end
