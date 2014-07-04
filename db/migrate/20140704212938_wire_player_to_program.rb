class WirePlayerToProgram < ActiveRecord::Migration
  def change
    add_column :players, :program_id, :integer
    add_index :players, :program_id
  end
end
