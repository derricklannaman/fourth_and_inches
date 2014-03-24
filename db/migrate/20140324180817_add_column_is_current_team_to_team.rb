class AddColumnIsCurrentTeamToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :active, :boolean, default: false
  end
end
