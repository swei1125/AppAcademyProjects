class CatsController < ApplicationController
  before_action :require_login
  before_action :require_user!, only: [:edit, :update, :new, :create]
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    # fail
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = current_user.cats.find(params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  # def is_owner?(cat)
  #   current_user.cats.include?(cat)
  # end
  #
  # def must_be_owner
  #   cat = Cat.find(params[:id])
  #   redirect_to cat_url(cat) unless is_owner?(cat)
  # end
end
