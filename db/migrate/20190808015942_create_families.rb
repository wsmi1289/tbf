class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.text :name
      t.integer :nitrogen, default: 0, null: false
      t.integer :biomass, default: 0, null: false
      t.integer :weed_competition, default: 0, null: false
      t.integer :erosion, default: 0, null: false
      t.integer :root_structure, default: 0, null: false
      t.jsonb :preceding, default: {}, null: false
      t.jsonb :succeeding, default: {}, null: false
      t.jsonb :companions, default: {}, null: false
    end
  end
end
