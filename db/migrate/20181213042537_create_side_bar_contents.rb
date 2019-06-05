class CreateSideBarContents < ActiveRecord::Migration[5.2]
  def change
    create_table :side_bar_contents do |t|
      t.belongs_to :side_bar
      t.text :content
      t.json :image
      t.text :link

      t.timestamps
    end
  end
end
