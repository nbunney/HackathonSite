class CreateSponsorshipTiers < ActiveRecord::Migration
  def change
    create_table :sponsorship_tiers do |t|
      t.references :event, index: true, foreign_key: true
      t.integer :price, null: false
      t.string :name, null: false
      t.string :color, limit: 6
      t.text :details, null: false, default: ''

      t.timestamps null: false
    end
  end
end
