class User < ActiveRecord::Base
has_many :worklogs
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
    def mondays_in_a_date_range(startdate,enddate)
      worklog_arr = worklogs
      time_period = worklog_arr.collect{|x| x.time_period}
      datearr=(startdate.to_date..enddate.to_date)
      datearr = datearr.select{|d| d.monday?}
      datearr - time_period
    end
end


