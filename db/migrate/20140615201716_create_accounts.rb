class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :balance, default: 0
      t.integer :user_id
      t.integer :player_id
      t.index :player_id
      t.index :user_id

      t.timestamps
    end
  end
end
