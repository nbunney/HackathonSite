# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  date               :date
#  description        :text
#  event_type         :integer          default("0"), not null
#  status             :integer          default("0"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string           not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  location_id        :integer
#

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  enum event_type: %i[mini normal]
  enum status: %i[open closed]

  has_attached_file :image

  validates_attachment :image,
    content_type: { content_type: %w[image/jpeg image/gif image/png] },
    size: { less_than: 20.megabytes }

  belongs_to :location
  has_many :sponsorship_tiers
  has_many :sponsorships, through: :sponsorship_tiers

  default_scope ->{ eager_load(:location) }
  scope :after, ->(date = Date.today){ where('date >= ?', date) }
  scope :before, ->(date = Date.today){ where('date < ?', date) }
  scope :by_date, ->{ order(:date) }
end
