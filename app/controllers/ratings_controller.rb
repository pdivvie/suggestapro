class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_business, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_location
  before_action :authenticate_user!

  after_action :verify_authorized, except: [:new, :create, :my_reviews]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
    authorize @ratings
  end

  def my_reviews
    @ratings = policy_scope(Rating)
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    authorize @rating
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
    authorize @rating
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.business_id = @business.id
    @rating.location_id = @location.id

    authorize @rating

    respond_to do |format|
      if @rating.save
        format.html { redirect_to [@location, @business], notice: 'Rating was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    authorize @rating
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to [@location, @business], notice: 'Rating was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    authorize @rating
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to [@location, @business], notice: 'Rating was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def set_business
      @business = Business.find(params[:business_id])
    end

    def set_location
      @location = Location.friendly.find(params[:location_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:stars, :business_id, :location_id, :comment, :user_id)
    end
end
