class RegistrationsController < Devise::RegistrationsController
  protected

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_up_path_for(resource)
    "/locations/#{current_user.location_id}/businesses"
  end

  def after_update_path_for(resource)
    "/#{current_user.location_id}/categories"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :password, :password_confirmation, :location_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :password, :password_confirmation])
  end

end