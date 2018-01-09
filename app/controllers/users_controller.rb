class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
    def user_params
      params.require(:user).permit(:name,:email,:password_confirmation)
    end
end
