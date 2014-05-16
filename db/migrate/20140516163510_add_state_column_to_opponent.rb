class AddStateColumnToOpponent < ActiveRecord::Migration
  def change
    add_column :opponents, :state, :string
  end
end
