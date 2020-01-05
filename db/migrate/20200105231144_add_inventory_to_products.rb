class AddInventoryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :inventory, :decimal, precision: 5, scale: 2
  end
end
