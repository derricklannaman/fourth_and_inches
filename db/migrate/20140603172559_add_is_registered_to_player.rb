class AddIsRegisteredToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :is_registered, :boolean, default: true
  end
end
