# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  team_id    :integer
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participant < ActiveRecord::Base
  counter_culture :event

  belongs_to :user
  belongs_to :team
  belongs_to :event
end
