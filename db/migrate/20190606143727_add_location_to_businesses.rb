class AddLocationToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :location, foreign_key: true
  end
end
