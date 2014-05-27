class ChangeColumnTypeInPlayer < ActiveRecord::Migration
  def change
   remove_column :players, :date_of_birth, :datetime
  end
end
