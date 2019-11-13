class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  layout 'application'
  
  def show
  end

  def index
    @contacts = Contact.where(location_id: @location.id)
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to location_contacts_url, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to location_contacts_url, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

    @contact.destroy
    respond_to do |format|
      format.html { redirect_to location_contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_location
      @location = Location.friendly.find(params[:location_id])
      redirect_to action: action_name, location_id: @location.friendly_id, status: 301 unless @location.friendly_id == params[:location_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contact_name, :contact_email, :contact_number, :location_id)
    end
end