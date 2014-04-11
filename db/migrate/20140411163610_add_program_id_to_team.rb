class AddProgramIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :program_id, :integer
    add_index(:teams, :program_id)
  end
end
