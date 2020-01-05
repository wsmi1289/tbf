class AddCropToProducts < ActiveRecord::Migration[5.2]
  def up
    add_reference :products, :crop, index: true, foreign_key: true
    Product.all.update_all(crop_id: 9)
    change_column_null :products, :crop_id, false
  end

  def down
    remove_reference(:products, :crop, index: true, foreign_key: true)
  end
end
