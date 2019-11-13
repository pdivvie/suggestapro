class AddContactsToLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :location, foreign_key: true
  end
end
