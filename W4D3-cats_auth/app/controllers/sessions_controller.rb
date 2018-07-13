class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if @user
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = "Invalid username and/or password"
      redirect_to new_session_url
    end
  end
  
  def destroy
    logout
    redirect_to new_session_url
  end
end
