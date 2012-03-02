class Worklog < ActiveRecord::Base
belongs_to :user
validates_presence_of :time_period
validates :time_period, :uniqueness => {:scope => :user_id,:message => "worklog saved for this time period"} 
validate :time_period_should_be_beginning_of_week
  def time_period_should_be_beginning_of_week
    if !time_period.nil?
      if time_period != time_period.beginning_of_week
        errors.add(:time_period, "should be beginning of week")
      end
    end
  end
  def give_mondays_within_a_given_date_range(startdate,enddate)
    datearr=(startdate.to_date..enddate.to_date)
    datearr.select{|d| d.monday?}
  end
end
