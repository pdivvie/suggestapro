class Location < ApplicationRecord
  has_many :businesses
  has_many :ratings
  has_many :users

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :thumb_image, LocationUploader
end
