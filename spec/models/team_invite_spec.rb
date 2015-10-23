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

require 'rails_helper'

RSpec.describe TeamInvite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
