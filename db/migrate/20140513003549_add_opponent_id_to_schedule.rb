class AddOpponentIdToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :opponent_id, :integer
    add_index :schedules, :opponent_id
  end
end
