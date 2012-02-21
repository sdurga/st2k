class ChangeColumnTypeFromTimeToDateFieldWorklog < ActiveRecord::Migration
  def up
    change_column :worklogs, :time_period, :date
  end

  def down
    change_column :worklogs, :time_period, :date
  end
end
