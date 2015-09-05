# == Schema Information
#
# Table name: sponsorship_tiers
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  price      :integer          not null
#  name       :string           not null
#  color      :string(6)
#  details    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SponsorshipTier < ActiveRecord::Base
  belongs_to :event
  has_many :sponsorships
  has_many :companies, through: :sponsorships
end
