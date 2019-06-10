class CreatePlantings < ActiveRecord::Migration[5.2]
  def change
    create_table :plantings do |t|
      t.date :seeded_at
      t.date :transplanted_at
      t.date :harvested_at
      t.references :field, index: true, foreign_key: true
      t.references :crop, index: true, foreign_key: true
    end
  end
end
