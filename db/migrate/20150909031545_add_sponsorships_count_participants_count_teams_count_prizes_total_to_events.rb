class AddSponsorshipsCountParticipantsCountTeamsCountPrizesTotalToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sponsorships_count, :integer, null: false, default: 0
    add_column :events, :participants_count, :integer, null: false, default: 0
    add_column :events, :teams_count, :integer, null: false, default: 0
    add_column :events, :prizes_total, :integer, null: false, default: 0
  end
end
