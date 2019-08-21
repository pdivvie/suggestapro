class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  after_action :verify_authorized

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.order('name ASC')
    authorize @categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    authorize @category
  end

  # GET /categories/new
  def new
    @category = Category.new
    authorize @category
  end

  # GET /categories/1/edit
  def edit
    authorize @category
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    authorize @category

    respond_to do |format|
      if @category.save
        format.html { redirect_to [@location, @category], notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    authorize @category

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to [@location, @category], notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    authorize @category

    @category.destroy
    respond_to do |format|
      format.html { redirect_to location_categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def set_location
      @location = Location.friendly.find(params[:location_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :display_in_navbar)
    end
end
