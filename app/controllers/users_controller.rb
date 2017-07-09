class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :delete]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
    @user.destroy
    redirect_to users_path
  end

    private

    def user_params
      params.require(:user).permit(:name)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
