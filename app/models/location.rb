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

class Location < ActiveRecord::Base
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode

  has_many :events, dependent: :nullify

  rails_admin do
    list do
      field :name
      field :address
      field :sub_address
      field :info
    end
    edit do
      field :name
      field :address
      field :sub_address
      field :info
      field :latitude
      field :longitude
    end
  end

  def coords
    "#{latitude},#{longitude}"
  end
end
