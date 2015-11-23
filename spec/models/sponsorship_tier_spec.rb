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
#  max_height :integer          default("100"), not null
#

require 'rails_helper'

RSpec.describe SponsorshipTier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
