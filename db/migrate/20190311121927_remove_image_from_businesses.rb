class RemoveImageFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_column :businesses, :main_image, :string
  end
end
