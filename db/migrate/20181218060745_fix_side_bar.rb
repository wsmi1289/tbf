class FixSideBar < ActiveRecord::Migration[5.2]
  def change
    drop_table :side_bars
    remove_reference :side_bar_contents, :side_bar, index: true
    add_reference :side_bar_contents, :page
    add_column :pages, :sidebar_status, :integer, default: 0
  end
end
