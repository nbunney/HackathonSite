class AddImageAndLocationToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.attachment :image
      t.references :location, index: true, foreign_key: true
    end
  end
end
