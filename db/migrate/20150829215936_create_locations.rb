class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :address, null: false
      t.string :sub_address, null: false, default: ''
      t.string :name, null: false
      t.text :info, null: false, default: ''

      t.timestamps null: false
    end
  end
end
