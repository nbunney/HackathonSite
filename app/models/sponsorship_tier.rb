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
  belongs_to :event, touch: true
  has_many :sponsorships
  has_many :companies, through: :sponsorships
  serialize :details

  validates :name, presence: true
  validates :event, presence: true
  validates :color, presence: true, length: { maximum: 7 }

  scope :available, ->{ where.not(price: nil) }
  scope :by_price, ->{ order('price DESC') }

  def available?
    !unavailable?
  end

  def unavailable?
    price.nil?
  end
end
