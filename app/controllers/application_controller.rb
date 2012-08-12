class ApplicationController < ActionController::Base
  layout "application"
  before_filter :authenticate_user!
  protect_from_forgery
end
