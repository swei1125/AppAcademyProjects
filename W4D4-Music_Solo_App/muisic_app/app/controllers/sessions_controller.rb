class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flsh.now[:errors] = ["Invalid email or/and password"]
      render :new
    end 
  end

  def destroy
    logout
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
