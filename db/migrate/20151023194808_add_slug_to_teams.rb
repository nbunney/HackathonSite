class AddSlugToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :slug, :string, null: false
  end
end
