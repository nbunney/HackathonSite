# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  about                  :text
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  email                  :string           not null
#  encrypted_password     :string           not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  admin                  :boolean          default("false"), not null
#  slug                   :string           not null
#

class User < ActiveRecord::Base
  extend FriendlyId
  include PgSearch
  friendly_id :name, use: :slugged
  has_many :participant, dependent: :destroy
  has_many :authentication, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: '300x300#', thumb: '100x100#' },
    default_url: '/images/:style/missing.png'

  validates_attachment :avatar,
    content_type: { content_type: %w[image/jpeg image/gif image/png] },
    size: { less_than: 5.megabytes }

  devise :confirmable, :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable
  pg_search_scope :search_by_name, against: :name

  rails_admin do
    list do
      field :name
      field :email
      include_all_fields
      exclude_fields :encrypted_password, :reset_password_token,
                     :confirmation_token
    end
  end

  def self.new_with_session(params, session)
    if session['prefill_signup']
      prefill = session['prefill_signup']['user']
      new(
        name: prefill['name'],
        email: prefill['email']
      )
    else
      super
    end
  end
end
