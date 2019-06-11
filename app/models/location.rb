class Location < ApplicationRecord
  has_many :businesses
  has_many :ratings

  mount_uploader :thumb_image, LocationUploader
end
