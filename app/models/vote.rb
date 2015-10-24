# == Schema Information
#
# Table name: votes
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  poll_id        :integer          not null
#  team_id        :integer          not null
#  score          :integer          default("0"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :participant
  belongs_to :poll
  belongs_to :team, touch: true

  validates :team, presence: true
  validates :poll, presence: true
  validates :participant, presence: true
  validates :score, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    integer_only: true
  }
  validate :not_voting_for_self

  def not_voting_for_self
    if team.id == participant.team_id
      errors[:base] << 'You cannot vote for yourself'
    end
  end
end
