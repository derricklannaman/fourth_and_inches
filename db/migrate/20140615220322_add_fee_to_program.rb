class AddFeeToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :fee, :decimal, precision: 30, scale: 2, default: 0
  end
end
