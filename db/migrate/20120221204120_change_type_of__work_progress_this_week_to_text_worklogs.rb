class ChangeTypeOf_workProgressThisWeekToTextWorklogs < ActiveRecord::Migration
  def up
    change_column :worklogs, :work_progress_this_week, :text
  end

  def down
   change_column :worklogs, :work_progress_this_week, :text
  end
end
