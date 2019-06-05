class AddTitleToSidebar < ActiveRecord::Migration[5.2]
  def change
    add_column :side_bar_contents, :title, :string
  end
end
