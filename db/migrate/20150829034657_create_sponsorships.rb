class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.references :sponsorship_tier, index: true, foreign_key: true, null: false
      t.references :company, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
