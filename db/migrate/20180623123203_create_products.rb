class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.json :image
      t.decimal :price, precision: 8, scale: 2
      t.string :category

      t.timestamps null: false
    end
  end
end
