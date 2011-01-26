# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :require_login

private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to url_for(:action => 'new', :controller => 'login')
    end
  end
  
  def current_user
    session[:user]
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
