class AddSlugToVariousModels < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string
    add_column :users, :slug, :string
    Event.find_each(&:save)
    User.find_each(&:save)
    change_column_null :events, :slug, false
    change_column_null :users, :slug, false
    add_index :events, :slug, unique: true
    add_index :users, :slug, unique: true
  end
end
