# == Schema Information
#
# Table name: team_invites
#
#  id               :integer          not null, primary key
#  team_id          :integer          not null
#  email            :string
#  acceptance_token :string           not null
#  user_id          :integer
#  accepted         :boolean          default("false"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TeamInvite < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
