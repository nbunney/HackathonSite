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
    (opened_at..closed_at).include?(Date.today)
  end

  def score
    votes.group(:team_id).sum(:score).order(:sum)
  end
end
