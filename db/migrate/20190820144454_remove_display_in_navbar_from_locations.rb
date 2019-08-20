class RemoveDisplayInNavbarFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :display_in_navbar, :boolean
  end
end
