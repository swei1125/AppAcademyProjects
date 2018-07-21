class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
  end
  
  def create 
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save 
      redirect_to goal_url(@goal)
      # debugger
    else 
      flash[:errors] = @goal.errors.full_messages
      redirect_to new_goal_url
    end 
  end
  
  def edit
    @goal = Goal.find(params[:id])
  end
  
  def update 
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
      # debugger
    else 
      flash[:errors] = ["Couldn't update goal"]
      redirect_to edit_goal_url
    end 
  end
  
  def show
    @goal = Goal.find(params[:id])
  end
  
  def destroy
    goal = Goal.find(params[:id])
    user=goal.user
    Goal.all.delete(goal)
    redirect_to user_url(user)
  end
  
  private 
  
  def goal_params
    params.require(:goal).permit(:body, :personal)
  end
end
