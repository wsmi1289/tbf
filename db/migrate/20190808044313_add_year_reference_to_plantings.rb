class AddYearReferenceToPlantings < ActiveRecord::Migration[5.2]
  def change
    add_reference :plantings, :year, index: true, foreign_key: true
  end
end
