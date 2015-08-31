class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.attachment :logo
      t.text :description, null: false, default: ''
      t.string :contact, null: false

      t.timestamps null: false
    end
  end
end
