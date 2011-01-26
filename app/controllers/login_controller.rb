class LoginController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    
  end
end