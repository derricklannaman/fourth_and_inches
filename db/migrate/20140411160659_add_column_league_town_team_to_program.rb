class AddColumnLeagueTownTeamToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :league_name, :string
    add_column :programs, :town_name, :string
    add_column :programs, :team_name, :string
  end
end
