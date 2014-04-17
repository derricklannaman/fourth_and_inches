class AddHeadCoachIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :head_coach, :integer
    add_index :teams, :head_coach
  end
end
