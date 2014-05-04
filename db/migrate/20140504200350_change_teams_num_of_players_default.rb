class ChangeTeamsNumOfPlayersDefault < ActiveRecord::Migration
  def change
    change_column_default :teams, :num_of_players, nil
  end
end
