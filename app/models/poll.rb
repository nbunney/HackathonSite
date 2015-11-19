# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  opened_at  :datetime
#  closed_at  :datetime
#  event_id   :integer          not null
#  public     :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ActiveRecord::Base
  validates :event, presence: true

  belongs_to :event, touch: true
  has_many :votes, dependent: :destroy
  # TODO: make this actually have a real choices table
  has_many :teams, through: :event

  scope :visible, ->{ where(public: true) }
  scope :open, ->(date = Date.today){
    where('opened_at >= ? AND closed_at < ?', date)
  }

  def open?
    now = Date.today
    now >= opened_at && now < closed_at
  end

  def score
    results = votes.group(:team_id).average(:score).map do |t, s|
      t = Team.find(t)
      [t.name, {
        members: t.participants.eager_load(:user).pluck('users.name'),
        score: s.to_f
      }]
    end
    Hash[results]
  end
end
