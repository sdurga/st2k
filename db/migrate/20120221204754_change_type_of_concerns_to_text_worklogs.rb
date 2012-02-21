class ChangeTypeOfConcernsToTextWorklogs < ActiveRecord::Migration
  def up
    change_column :worklogs, :concerns, :text
  end

  def down
    change_column :worklogs, :concerns, :text
  end
end
