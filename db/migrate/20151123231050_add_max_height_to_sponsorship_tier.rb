class AddMaxHeightToSponsorshipTier < ActiveRecord::Migration
  def change
    add_column :sponsorship_tiers, :max_height, :integer, null: false, default: 100
  end
end
