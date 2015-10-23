# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  description       :text             default(""), not null
#  contact           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  url               :string
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
