class ChangePlayerIsRegisteredDefault < ActiveRecord::Migration
  def change
    change_column_default :players, :is_registered, false
  end
end
