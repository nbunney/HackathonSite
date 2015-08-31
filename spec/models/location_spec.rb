# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  latitude    :float            not null
#  longitude   :float            not null
#  address     :string           not null
#  sub_address :string           default(""), not null
#  name        :string           not null
#  info        :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
