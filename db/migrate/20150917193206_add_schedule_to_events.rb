class AddScheduleToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.text :schedule
    end
  end
end
