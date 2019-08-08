class CreateYears < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.date :start
      t.date :end
      t.integer :current, default: Date.current.year
    end
  end
end
