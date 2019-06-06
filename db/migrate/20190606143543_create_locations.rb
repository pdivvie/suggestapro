class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.boolean :display_in_navbar

      t.timestamps
    end
  end
end
