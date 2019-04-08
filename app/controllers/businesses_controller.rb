class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  layout "business"

  access all: [:show, :index], user: :all, site_admin: :all

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @page_title = @business.name
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id if current_user

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    @business = Business.friendly.find(params[:id])
    if current_user == @business.user || current_user.role == :site_admin
      respond_to do |format|
        if @business.update(business_params)
          format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @business, notice: 'You do not have authorization to complete this action' }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business = Business.friendly.find(params[:id])
    if current_user == @business.user || current_user.role == :site_admin
      @business.destroy

      respond_to do |format|
        format.html { redirect_to businesses_path, notice: 'Record was removed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to businesses_path, notice: 'Record could not be removed.' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_business
    @business = Business.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_params
    params.require(:business).permit(:name, :body, :main_image)
  end
end
