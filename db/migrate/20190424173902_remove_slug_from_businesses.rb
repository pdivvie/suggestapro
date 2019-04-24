class RemoveSlugFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_index :businesses, :slug
    remove_column :businesses, :slug
  end
end
