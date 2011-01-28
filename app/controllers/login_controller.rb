class LoginController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  layout "login"

  def new
  end
  
  def create
    user = User.authenticate(params)
    if user
      session[:current_user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Incorrect username or password"
      redirect_to url_for(:action => "new")
    end
  end
  
  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end
end