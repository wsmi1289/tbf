class FixUserPermissions < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :integer, default: 0, null: false

    execute <<-SQL
      UPDATE users SET role = 1 WHERE admin = true;
      UPDATE users SET role = 2 WHERE client = true;
    SQL

    remove_column :users, :admin
    remove_column :users, :client
  end

  def down
    add_column :users, :admin, :boolean, default: false
    add_column :users, :client, :boolean, default: false

    execute <<-SQL
      UPDATE users SET admin = true WHERE role = 1;
      UPDATE users SET client = true WHERE role = 2;
    SQL

    remove_column :users, :role
  end
end
