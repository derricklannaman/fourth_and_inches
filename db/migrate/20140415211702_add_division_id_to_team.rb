class AddDivisionIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :division_id, :integer
    add_index :teams, :division_id
  end

end
