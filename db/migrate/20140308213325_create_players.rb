class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :town
      t.string :zip
      t.integer :dob
      t.string :team_id
      t.string :parent_id
      t.integer :age

      t.timestamps
    end
  end
end
