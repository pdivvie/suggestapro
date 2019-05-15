class Business < ApplicationRecord

  belongs_to :user
  has_many :ratings

  resourcify

  mount_uploader :main_image, BusinessUploader
end
