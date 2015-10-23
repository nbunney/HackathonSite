class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.datetime :opened_at
      t.datetime :closed_at
      t.references :event, null: false
      t.boolean :public, null: false, default: false

      t.timestamps null: false
    end
  end
end
