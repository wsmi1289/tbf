class AddSoilDataToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :soil_surface_temp, :decimal
    add_column :weathers, :soil_10cm_temp, :decimal
    add_column :weathers, :soil_moisture, :decimal
    add_column :weathers, :measurement_date, :date
  end
end
