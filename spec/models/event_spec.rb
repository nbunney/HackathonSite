# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  date               :date
#  description        :text
#  event_type         :integer          default("0"), not null
#  status             :integer          default("0"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string           not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  location_id        :integer
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
