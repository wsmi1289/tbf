class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.decimal :max_temp
      t.decimal :min_temp
      t.decimal :precipitation
      t.decimal :avg_wind_speed
      t.decimal :solar_radiation
      t.integer :dew_point
      t.decimal :max_soil_temp
      t.decimal :min_soil_temp
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
