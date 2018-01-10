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
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    
    if @activity.save
      redirect_to activity_path(@activity)
    else
      redirect_to user_path(current_user)
    end
    

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def activity_params
    params.require(:activity).permit(:image_url, :note, :date_completed, :category, :neighborhood, :rating, :name, :link)
  end
end
