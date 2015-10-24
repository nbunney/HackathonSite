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

require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
