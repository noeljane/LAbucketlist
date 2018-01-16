class ActivitiesController < ApplicationController
  before_action :verify_activity_owner, only: [:edit, :update, :destroy]
  
  def index
    if params[:q]
      @activities = Activity.where("name ILIKE ?", "%#{params[:q]}%")
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @comment = Comment.new
    @user = @activity.user
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.image_url.include?("http")
      if @activity.save
        redirect_to activity_path(@activity)
      else
        flash[:danger] = "You need to be signed in."
        redirect_to new_activity_path
      end
    else
      flash[:danger] = "Your image URL needs to include http."
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



  def copy
    @activity = Activity.find(params[:id]).dup
    @activity.user = current_user
    @activity.date_completed = nil
    if @activity.save
      redirect_to user_path(current_user)
    else
      redirect_to activity_path(params[:id])
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:image_url, :note, :date_completed, :category, :neighborhood, :rating, :name, :link)
  end
end
