class SessionsController < ApplicationController
  def destroy
    logout
    redirect_to new_user_url
  end
end