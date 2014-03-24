class RemovePlayerIdFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :player_id
  end
end
