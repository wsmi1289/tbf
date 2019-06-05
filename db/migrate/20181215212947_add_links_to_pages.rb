class AddLinksToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :nav_select, :boolean, default: true
    add_column :pages, :nav_btn, :boolean, default: false
  end
end
