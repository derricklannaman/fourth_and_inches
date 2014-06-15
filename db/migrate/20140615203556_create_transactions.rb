class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :payment, precision: 30, scale: 2, default: 0
      t.decimal :account_credit, precision: 30, scale: 2, default: 0
      t.integer :user_id
      t.integer :account_id
      t.index :user_id
      t.index :account_id
      t.timestamps
    end
  end
end
