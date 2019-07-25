class AddLinkToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :link, :string
  end
end
