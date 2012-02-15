class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :who
      t.text :what
      t.datetime :requested_date

      t.timestamps
    end
  end
end
