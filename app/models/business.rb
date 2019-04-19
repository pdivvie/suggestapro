class Business < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  resourcify

  def blank_stars
   5 - rating.to_i
  end
end
