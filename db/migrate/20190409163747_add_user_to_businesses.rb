class AddUserToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :user, index: true, foreign_key: true
  end
end
