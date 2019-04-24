class Business < ApplicationRecord

  belongs_to :user
  has_many :ratings

  resourcify
end
