class AddThumbImageToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :thumb_image, :text
  end
end
