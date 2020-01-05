class CreateHarvests < ActiveRecord::Migration[5.2]
  def change
    create_table :harvests do |t|
      t.references :planting, index: true, foreign_key: true
      t.integer :area_unit # bed_ft, area etc..
      t.decimal :area, precision: 5, scale: 2
      t.integer :measurement_unit # lbs, ozs, crates
      t.decimal :measurement, precision: 5, scale: 2 # amount in unit
      t.decimal :yield, precision: 5, scale: 2 # measurement/area
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
    rename_column :plantings, :harvested_at, :target_harvest_date
  end
end
