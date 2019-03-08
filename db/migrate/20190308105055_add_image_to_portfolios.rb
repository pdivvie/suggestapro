class AddImageToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :main_image, :text
    add_column :portfolios, :thumb_image, :text
  end
end
