class FixJsonImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image, :json
    remove_column :products, :image, :json
    remove_column :side_bar_contents, :image, :json
    remove_column :users, :image, :json
    add_column :posts, :image, :string
    add_column :products, :image, :string
    add_column :side_bar_contents, :image, :string
    add_column :users, :image, :string
  end
end
