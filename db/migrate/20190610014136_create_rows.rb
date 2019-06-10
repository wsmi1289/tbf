class CreateRows < ActiveRecord::Migration[5.2]
  def change
    create_table :rows do |t|
      t.integer :row_width
      t.integer :bed_width
      t.references :field, index: true, foreign_key: true
    end
  end
end
