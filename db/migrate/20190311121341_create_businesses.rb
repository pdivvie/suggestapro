class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :body
      t.string :main_image

      t.timestamps
    end
  end
end
