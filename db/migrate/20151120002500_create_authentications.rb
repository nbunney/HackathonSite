class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :service, null: false
      t.string :uid, null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
    add_index :authentications, [:service, :uid], unique: true
    add_index :authentications, [:service, :user_id], unique: true
  end
end
