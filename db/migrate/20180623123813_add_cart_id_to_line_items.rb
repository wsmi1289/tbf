class AddCartIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_reference(:line_items, :cart)
  end
end
