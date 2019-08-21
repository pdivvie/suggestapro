class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  after_action :verify_authorized

  def index
    @subcategories = Subcategory.order('title ASC')
    authorize @subcategories

    if params[:search]
      @search_term_subcategory = params[:search]
      @subcategories = @subcategories.search_by(@search_term_subcategory)
    end
  end

  def new
    @subcategory = Subcategory.new
    authorize @subcategory
  end

  def edit
    authorize @subcategory
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    authorize @subcategory

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to location_subcategories_url, notice: 'Subcategory was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @subcategory

    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to location_subcategories_url, notice: 'Subcategory was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @subcategory

    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to location_subcategories_url, notice: 'Subcategory was successfully destroyed.' }
    end
  end

  private
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    def set_location
      @location = Location.friendly.find(params[:location_id])
    end

    def subcategory_params
      params.require(:subcategory).permit(:title, :category_id)
    end
end