class ApplicationController < ActionController::Base
  include CurrentUserConcern
  include DeviseWhitelist
  include DefaultPageContent
  include Pundit
  protect_from_forgery
end
