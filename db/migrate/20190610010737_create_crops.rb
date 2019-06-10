class CreateCrops < ActiveRecord::Migration[5.2]
  def change
    create_table :crops do |t|
      t.text :name
      t.text :family
      t.boolean :transplanted
    end
  end
end
