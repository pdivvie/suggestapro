class CreateRatings < ActiveRecord::Migration[5.2]
  def self.up
    create_table :ratings do |t|
      t.references :business
      t.integer :stars

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
