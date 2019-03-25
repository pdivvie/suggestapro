class ApplicationController < ActionController::Base
  include CurrentUserConcern
  include DeviseWhitelist
  include DefaultPageContent
end
