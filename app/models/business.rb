class Business < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :ratings
  resourcify

  def blank_stars
   5 - rating.to_i
  end
end
