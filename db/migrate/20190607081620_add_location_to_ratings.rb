class AddLocationToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :location, foreign_key: true
  end
end
