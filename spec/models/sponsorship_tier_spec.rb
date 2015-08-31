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

require 'rails_helper'

RSpec.describe SponsorshipTier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
