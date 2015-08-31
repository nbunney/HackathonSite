class AddRealNameAndRankToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :name, :username
    change_column_null :users, :username, false
    add_column :users, :real_name, :string, null: false
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
