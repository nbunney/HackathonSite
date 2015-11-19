class MoveRealNameToName < ActiveRecord::Migration
  def change
    rename_column :users, :real_name, :name
  end
end
