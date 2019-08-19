class CategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  after_action :verify_authorized

  # GET /categories
  # GET /categories.json
  def index
    @subcategories = Subcategory.order('name ASC')
    authorize @subcategories

    if params[:search]
      @search_term_subcategory = params[:search]
      @subcategories = @subcategories.search_by(@search_term_subcategory)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @subcategory = Subcategory.find(params[:id])
    end

    def set_location
      @location = Location.friendly.find(params[:location_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:subcategory).permit(:title, :category_id)
    end
end