class CreateAccessCodes < ActiveRecord::Migration
  def change
    create_table :access_codes do |t|
      t.string :access_code
      t.integer :program_id
      t.integer :user_id
      t.index :program_id
      t.index :user_id

      t.timestamps
    end
  end
end
