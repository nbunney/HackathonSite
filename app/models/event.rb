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
#  sponsorships_count :integer          default("0"), not null
#  participants_count :integer          default("0"), not null
#  teams_count        :integer          default("0"), not null
#  prizes_total       :integer          default("0"), not null
#  schedule           :text
#

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum event_type: %i[mini normal]
  enum status: %i[open closed]
  serialize :schedule, Array

  has_attached_file :image, styles: {
      display: '2340x800#',
    },
    convert_options: {
      display: '-quality 50 -strip'
    },
    processors: [:auto_orient, :thumbnail]

  validates_attachment :image,
    content_type: { content_type: %w[image/jpeg image/gif image/png] },
    size: { less_than: 20.megabytes }

  belongs_to :location
  has_many :participants, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :sponsorship_tiers, dependent: :destroy
  has_many :sponsorships, through: :sponsorship_tiers
  has_many :polls, dependent: :destroy

  default_scope ->{ eager_load(:location) }
  scope :after, ->(date = Date.today){ where('date >= ?', date) }
  scope :before, ->(date = Date.today){ where('date < ?', date) }
  scope :by_date, ->{ order(:date) }

  rails_admin do
    list do
      sort_by :date
      field :name
      field :date do
        sort_reverse true
      end
      field :location
      field :event_type
      field :status
    end
    edit do
      field :name
      field :slug
      field :date
      field :event_type
      field :status
      field :image
      field :location
      field :schedule, :serialized
      field :teams
      field :sponsorship_tiers
      field :prizes_total
    end
  end

  def sorted_schedule
    schedule.sort_by { |s| s[:time] }
            .group_by { |s| s[:time].to_date }
  end

  def upcoming?
    date > Date.today
  end

  def participant(user)
    participants.where(user: user).first
  end
end
