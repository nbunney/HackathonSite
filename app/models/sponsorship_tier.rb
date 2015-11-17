# == Schema Information
#
# Table name: sponsorship_tiers
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  price      :integer
#  name       :string           not null
#  color      :string           not null
#  details    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  columns    :integer          default("4"), not null
#  featured   :boolean          default("false"), not null
#

class SponsorshipTier < ActiveRecord::Base
  belongs_to :event, touch: true
  has_many :sponsorships, dependent: :destroy
  has_many :companies, through: :sponsorships
  serialize :details, Array

  validates :name, presence: true
  validates :event, presence: true
  validates :color, presence: true, length: { maximum: 7 }

  scope :available, ->{ where.not(price: nil) }
  scope :by_price, ->{ order('price DESC') }

  rails_admin do
    list do
      field :event
      field :name
      field :price
      field :color, :color
    end
    edit do
      field :event
      field :name
      field :price
      field :color, :color
      field :details, :serialized
      field :columns
      field :featured
    end
  end

  def available?
    !unavailable?
  end

  def unavailable?
    price.nil?
  end
end
