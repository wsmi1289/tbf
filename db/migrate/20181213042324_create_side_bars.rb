class CreateSideBars < ActiveRecord::Migration[5.2]
  def change
    create_table :side_bars do |t|
      t.belongs_to :page
      t.boolean :side

      t.timestamps
    end
  end
end
