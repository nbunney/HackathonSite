class AddFeaturedToSponsorshipTiers < ActiveRecord::Migration
  def change
    add_column :sponsorship_tiers, :featured, :boolean, default: false, null: false
  end
end
