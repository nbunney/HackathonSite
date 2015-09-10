class Team < ActiveRecord::Base
  counter_culture :event
  belongs_to :event
end
