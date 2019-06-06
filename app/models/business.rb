class Business < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :ratings

  resourcify

  mount_uploader :main_image, BusinessUploader

  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
