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
#  contact           :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :sponsorships
  has_attached_file :logo,
    styles: { medium: '300x150>', thumb: '150x75>' },
    default_url: '/images/:style/missing.png'

  validates :logo, presence: true
  validates :name, presence: true
  validates :description, length: { maximum: 500 }
  validates :contact, presence: true
  validates_attachment :logo,
    content_type: { content_type: %w[image/jpeg image/gif image/png] },
    size: { less_than: 5.megabytes }
end
