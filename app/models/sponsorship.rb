# == Schema Information
#
# Table name: sponsorships
#
#  id                  :integer          not null, primary key
#  sponsorship_tier_id :integer          not null
#  company_id          :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Sponsorship < ActiveRecord::Base
  # Keep count of sponsors on Event
  counter_culture [:sponsorship_tier, :event]

  belongs_to :sponsorship_tier
  belongs_to :company

  validates :company, presence: true
  validates :sponsorship_tier, presence: true
end
