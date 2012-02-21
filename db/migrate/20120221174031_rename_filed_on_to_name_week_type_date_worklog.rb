class RenameFiledOnToNameWeekTypeDateWorklog < ActiveRecord::Migration
  def up
    change_table :worklogs do |t|
      t.rename :filed_on, :time_period
    end
  end

  def down
    change_table :worklogs do |t|
      t.rename :time_period, :filed_on
    end
  end
end
