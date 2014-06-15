class AddActiveAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :hasActiveAccount, :boolean, default: false
  end
end
