class AddLinkEnumToPages < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :nav_select
    remove_column :pages, :nav_btn
    add_column :pages, :link_position, :integer, default: 0
  end
end
