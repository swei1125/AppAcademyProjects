class SubsController < ApplicationController
  before_action :moderator_check, only: [:edit, :update]
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def moderator_check
    @sub = Sub.find(params[:id])
    redirect_to subs_url unless @sub.moderator == current_user
  end
end
