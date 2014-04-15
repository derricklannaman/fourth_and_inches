class AddWeightClassToDivision < ActiveRecord::Migration
  def change
    add_column :divisions, :weight_class, :string
  end
end
