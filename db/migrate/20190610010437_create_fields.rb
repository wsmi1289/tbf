class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :length
      t.integer :width
    end
  end
end
