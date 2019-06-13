class AddPercentUsedToBed < ActiveRecord::Migration[5.2]
  def change
    add_column :beds, :percent_used, :decimal, precision: 5, scale: 2
  end
end
