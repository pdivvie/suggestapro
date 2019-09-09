class ApplicationController < ActionController::Base
  include CurrentUserConcern
  include DeviseWhitelist
  include DefaultPageContent
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_in_path_for(resource)
    "/locations/#{current_user.location_id}/categories"
  end

  def after_sign_out_path_for(resource)
    "/about"
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
