module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Rating Site"
    @seo_keywords = "Rating, Business, Heldervue, Somerset West, Strand, Gordons Bay, Stellenbosch"
  end
end