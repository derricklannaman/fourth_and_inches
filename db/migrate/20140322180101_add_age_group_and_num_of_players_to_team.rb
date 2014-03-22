class AddAgeGroupAndNumOfPlayersToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :age_group, :string
    add_column :teams, :num_of_players, :integer, default: 11
  end
end
