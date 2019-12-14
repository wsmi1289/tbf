class AddAgApiIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ag_api_id, :string
  end
end
