class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :age_group
      t.references :program, index: true

      t.timestamps
    end
  end
end
