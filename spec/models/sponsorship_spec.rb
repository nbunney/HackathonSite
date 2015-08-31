# == Schema Information
#
# Table name: sponsorships
#
#  id                  :integer          not null, primary key
#  sponsorship_tier_id :integer          not null
#  company_id          :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Sponsorship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
