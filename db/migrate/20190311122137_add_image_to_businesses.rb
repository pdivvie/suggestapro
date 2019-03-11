class AddImageToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :main_image, :text
  end
end
