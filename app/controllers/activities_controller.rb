class ActivitiesController < ApplicationController
  def index
    if params[:q]
      @activities = Activity.where("name ILIKE ?", "%#{params[:q]}%")
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @user_id = @activity.user_id
    @user = User.find(@user_id)
    @comment = Comment.new

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    
    if @activity.save
      redirect_to activity_path(@activity)
    else
      redirect_to new_activity_path
    end
    

  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.destroy
      redirect_to activities_path
    else
      redirect_to activity_path(@activity)
    end
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:image_url, :note, :date_completed, :category, :neighborhood, :rating, :name, :link)
  end
end
