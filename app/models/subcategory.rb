class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :businesses

  def self.search_by(search_term_subcategory)
    where("LOWER(title) LIKE :search_term_subcategory", search_term_subcategory: "%#{search_term_subcategory.downcase}%")
  end
end
