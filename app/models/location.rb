class Location < ApplicationRecord
  has_many :businesses
  has_many :ratings
end
