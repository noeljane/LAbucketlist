class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @activity = Activity.find(params[:activity_id])
    @comment.activity = @activity
    if @comment.save
      redirect_to activity_path(@activity)
    else
      redirect_to activity_path(@activity)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @activity = Activity.find(params[:activity_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    @comment.user = current_user
    if @comment.update(comment_params)
      redirect_to activity_path(@activity)
    else
      redirect_to activity_path(@activity)
    
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
      redirect_to activities_path
    else
      redirect_to activity_path
    end
  end
  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end
