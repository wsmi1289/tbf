class AddAvgToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :avg_temp, :decimal
  end
end
