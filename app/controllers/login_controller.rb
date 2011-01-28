require 'digest/sha1'
class LoginController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    
  end
  
  def create
    user = User.first(:conditions => {:email => params[:email], :password => Digest::SHA1.hexdigest(params[:password])})
    if user
      session[:current_user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Incorrect username or password"
      redirect_to url_for(:action => "new")
    end
  end
end