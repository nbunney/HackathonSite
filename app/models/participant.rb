class Participant < ActiveRecord::Base
  counter_culture :event

  belongs_to :user
  belongs_to :team
  belongs_to :event
end
