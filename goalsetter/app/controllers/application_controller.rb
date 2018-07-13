class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_user
    return nil unless session[:session_token]
    @current_user
  end
  
  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end
  
  def logout
    session[:session_token] = nil
  end
end
