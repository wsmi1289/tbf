class AddCategoryReferenceToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category, :string
    add_column :products, :category_id, :integer
    add_index :products, :category_id
  end
end
