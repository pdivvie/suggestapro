class Category < ApplicationRecord
  has_many :businesses

  def self.search_by(search_term_cat)
    where("LOWER(name) LIKE :search_term_cat", search_term_cat: "%#{search_term_cat.downcase}%")
  end

end
