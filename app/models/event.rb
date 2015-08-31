# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  date        :date
#  description :text
#  event_type  :integer          default("0"), not null
#  status      :integer          default("0"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  has_many :sponsorship_tiers
  has_many :sponsorships, through: :sponsorship_tiers

  scope :after, ->(date = Date.today){ where('date >= ?', date) }
  scope :before, ->(date = Date.today){ where('date < ?', date) }
  scope :by_date, ->{ order(:date) }
end
