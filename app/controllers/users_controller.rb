class UsersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_page

  before_action :set_user, only: [:show, :edit, :update, :delete, :check_cart, :show_after_purchase, :show_after_return]
  #before_action :authorize

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    @user.is_admin = true if check_admin_password

    return redirect_to new_admin_path if params[:user][:admin_password] && !check_admin_password

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
    @cart_purchases = ShoppingCart.display_purchased_items(@user.id)
    @rentals = Rental.all.select {|rental| rental.user_id == session[:user_id]}
    # @user = User.find(params[:id])
  end

  def edit
    if session[:user_id]
      if (params[:id].to_i == session[:user_id]) || current_user.is_admin
        @user = User.find(params[:id])
      else
        redirect_to bad_request_path
      end
    else
      redirect_to signup_path
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

  def choose_profile
  end

  def new_admin
  end

  def added_to_cart
    set_user
    #TODO seperate into two methods
    @vacuum = Vacuum.find(params[:vacuum_id])
    @vacuum.purchase_stock -= 1
    @vacuum.save

    @shopping_cart = ShoppingCart.new(user_id: @user.id, vacuum_id: params[:vacuum_id])
    @shopping_cart.save
    redirect_to check_cart_path(@user)
  end

  def removed_from_cart
    #byebug
    set_user
    @vacuum = Vacuum.find(params[:vacuum_id])
    @vacuum.purchase_stock += 1
    @vacuum.save
    @cart = ShoppingCart.find_by(vacuum_id: params[:vacuum_id], is_purchased: false)
    @cart.destroy
    @carts = ShoppingCart.display_cart(session[:user_id])
    redirect_to check_cart_path(@user)
  end

  def check_cart
    @total = ShoppingCart.total(session[:user_id])
    @cart = ShoppingCart.display_cart(session[:user_id])
  end

  def show_after_purchase

    if @user.wallet >= params[:total].to_i
      @cart_purchases = ShoppingCart.user_carts(session[:user_id]).map do |cart|
        cart.is_purchased = true
        cart.save
      end
      @user.wallet -= params[:total].to_i
      @user.save
    end

    redirect_to user_path(session[:user_id])
  end

  def show_after_return
    @cart = ShoppingCart.find_by(user_id: session[:user_id], vacuum_id: params[:vacuum_id])
    @vacuum = Vacuum.find(params[:vacuum_id])
    @vacuum.purchase_stock += 1
    @vacuum.save
    @user.wallet += params[:vacuum_price].to_i
    @user.save
    @cart.destroy
    redirect_to user_path(session[:user_id])
  end

    private

    def check_admin_password
      if params[:user][:admin_password]
        params[:user][:admin_password] == "admin" ? true : false
      else
        false
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :is_admin, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def invalid_page
      render file: 'errors/error_400.html.erb', status: :bad_request
    end

end
