class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.text :slug, null: false
      t.text :name, null: false
      t.text :content
      
      t.timestamps null: false
    end
  end
end
