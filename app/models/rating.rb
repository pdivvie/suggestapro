class Rating < ApplicationRecord
  belongs_to :business
  belongs_to :user
  belongs_to :location

  validates :user_id,
  uniqueness:
  {scope: :business_id,
    message: "You can't review a business twice"}
end
