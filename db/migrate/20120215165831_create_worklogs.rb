class CreateWorklogs < ActiveRecord::Migration
  def change
    create_table :worklogs do |t|
      t.string :who
      t.string :work_progress_this_week
      t.string :concerns
      t.datetime :filed_on

      t.timestamps
    end
  end
end
