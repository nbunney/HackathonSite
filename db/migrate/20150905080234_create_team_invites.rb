class CreateTeamInvites < ActiveRecord::Migration
  def change
    create_table :team_invites do |t|
      t.references :team, index: true, foreign_key: true, null: false
      t.string :email
      t.string :acceptance_token, null: false
      t.references :user, index: true, foreign_key: true
      t.boolean :accepted, null: false, default: false

      t.timestamps null: false
    end
  end
end
