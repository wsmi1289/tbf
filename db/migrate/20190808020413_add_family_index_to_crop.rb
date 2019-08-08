class AddFamilyIndexToCrop < ActiveRecord::Migration[5.2]
  def change
    remove_column :crops, :family
    add_reference :crops, :family, index: true, foreign_key: true
  end
end
