# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string           not null
#

class Team < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  counter_culture :event

  belongs_to :event, touch: true
end
