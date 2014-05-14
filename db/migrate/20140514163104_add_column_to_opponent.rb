class AddColumnToOpponent < ActiveRecord::Migration
  def change
    add_column :opponents, :street, :string
    add_column :opponents, :town, :string
    add_column :opponents, :zip, :string
  end
end
