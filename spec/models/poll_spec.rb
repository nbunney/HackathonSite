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

require 'rails_helper'

RSpec.describe Poll, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
