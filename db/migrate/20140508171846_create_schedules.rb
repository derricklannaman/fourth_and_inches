class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :time
      t.string :type
      t.integer :team_id
      t.index :team_id

      t.timestamps
    end
  end
end
