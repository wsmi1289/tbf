class AddBedsToPlantingsFields < ActiveRecord::Migration[5.2]
  def change
    rename_table :rows, :beds
    rename_column :fields, :num_rows, :num_beds
    rename_column :plantings, :num_rows, :num_beds
    remove_column :plantings, :row_width
    add_column :crops, :row_spacing, :decimal, precision: 5, scale: 2
    add_column :crops, :plant_spacing, :decimal, precision: 5, scale: 2
  end
end
