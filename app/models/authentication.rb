# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  service    :integer          not null
#  uid        :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  SERVICE_MAPPINGS = {
    'github' => 'github',
    'twitter' => 'twitter',
    'facebook' => 'facebook',
    'google_oauth2' => 'google'
  }

  belongs_to :user

  enum service: %i[github twitter facebook google]
end
