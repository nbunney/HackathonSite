class AddUniquenessConstraints < ActiveRecord::Migration
  def change
    # Make Company#contact nullable and SponsorshipTier#color not
    change_column_null :companies, :contact, true
    change_column_null :sponsorship_tiers, :color, false

    # Add a shitload of unique indices
    add_index :companies, :name, unique: true
    add_index :events, :name, unique: true
    add_index :locations, :name, unique: true
    add_index :participants, [:user_id, :event_id], unique: true
    add_index :sponsorship_tiers, [:event_id, :name], unique: true
    add_index :sponsorships, [:sponsorship_tier_id, :company_id], unique: true
    add_index :team_invites, [:team_id, :email, :user_id], unique: true
    add_index :teams, [:event_id, :name], unique: true
  end
end
