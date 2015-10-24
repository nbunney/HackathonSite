class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :participant, null: false
      t.references :poll, null: false
      t.references :team, null: false
      t.integer :score, null: false, default: 0
      t.timestamps null: false
    end
  end
end
