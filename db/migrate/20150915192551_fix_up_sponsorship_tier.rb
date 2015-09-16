class FixUpSponsorshipTier < ActiveRecord::Migration
  def up
    # Number of columns to use for this tier's display
    add_column :sponsorship_tiers, :columns, :int, default: 4, null: false
    # Add # in front
    change_column :sponsorship_tiers, :color, :string, length: 7
    # Null price = hidden
    change_column_null :sponsorship_tiers, :price, true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
