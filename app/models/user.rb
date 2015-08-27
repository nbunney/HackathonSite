class User < ActiveRecord::Base
  devise :confirmable, :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable

  has_attached_file :avatar,
    styles: { medium: '300x300!', thumb: '100x100!' },
    default_url: '/images/:style/missing.png'

  validates_attachment :avatar,
    content_type: { content_type: %w[image/jpeg image/gif image/png] },
    size: { in: 0..50.kilobytes }
end
