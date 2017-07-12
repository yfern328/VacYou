class UsersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_page

  before_action :set_user, only: [:show, :edit, :update, :delete]
  #before_action :authorize

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to home_path
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    if params[:id] == session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to bad_request_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
    @user.destroy
    redirect_to users_path
  end

  def added_to_cart
    set_user
    @shopping_cart = ShoppingCart.new(user_id: @user.id, vacuum_id: params[:vacuum_id])
    @shopping_cart.save
  end

  def check_cart
    @shopping_carts = ShoppingCart.all.select {|cart| cart.user_id == session[:user_id]}
    @items_hash = Hash.new(0)
    @shopping_carts.each {|cart| @items_hash[Vacuum.find(cart.vacuum_id).name] += 1 }
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def invalid_page
      render file: 'errors/error_400.html.erb', status: :bad_request
    end

end
