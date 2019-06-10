class AddNumRowsToPlantings < ActiveRecord::Migration[5.2]
  def change
    add_column :plantings, :num_rows, :decimal, precision: 5, scale: 2
    add_column :plantings, :row_width, :integer
    add_column :plantings, :bed_width, :integer
    remove_column :rows, :row_width, :integer
    remove_column :rows, :bed_width, :integer
    add_reference :rows, :planting, index: true, foreign_key: true
    add_column :fields, :num_rows, :integer
  end
end
