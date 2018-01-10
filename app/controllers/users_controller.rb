class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
    @activity = Activity.new
    @user.activities 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(user_path(@user))
    else
      redirect_to(new_user_path)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
    def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation)
    end
end
