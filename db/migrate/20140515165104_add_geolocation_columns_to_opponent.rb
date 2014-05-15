class AddGeolocationColumnsToOpponent < ActiveRecord::Migration
  def change
    add_column :opponents, :address, :string
    add_column :opponents, :latitude, :float
    add_column :opponents, :longitude, :float
  end
end
