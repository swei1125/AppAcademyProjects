class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = 'Invalid password or username'
      redirect_to new_user_url
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
