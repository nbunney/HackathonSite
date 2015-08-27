class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date
      t.text :description
      t.integer :event_type, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
