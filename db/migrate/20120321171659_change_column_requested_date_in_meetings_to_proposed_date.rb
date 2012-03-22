class ChangeColumnRequestedDateInMeetingsToProposedDate < ActiveRecord::Migration
 def up
    change_table :meetings do |t|
      t.rename :requested_date, :proposed_date_for_meeting
    end
  end

  def down
    change_table :meetings do |t|
      t.rename :requested_date, :proposed_date_for_meeting
    end
  end
end
