class GoalsController < ApplicationController
  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    goal = Goal.new(goal_params)
    if goal && goal.save
      redirect_to(goal_url(goal))
    else
      flash[:errors] = goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    render :edit
  end

  def update
    goal = Goal.find_by(id: params[:id])
    if goal && goal.update_attributes(goal_params)
      redirect_to(goal_url(goal))
    else
      flash[:errors] = goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    goal = Goal.find_by(id: params[:id])
    user = goal.user
    if goal && goal.destroy
      redirect_to user_url(user)
    else
      flash[:errors] = ["Could not delete goal"]
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def goal_params
    params.require(:goal).permit(:title, :user_id, :private?, :completed?, :details)
  end
end
