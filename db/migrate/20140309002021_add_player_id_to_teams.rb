class AddPlayerIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :player_id, :integer
    add_index :teams, :player_id
    add_index :teams, :user_id
  end
end
