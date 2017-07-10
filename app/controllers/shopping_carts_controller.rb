class ShoppingCartsController < ApplicationController

  before_action :set_shopping_cart, only: [:show, :edit, :update, :delete]
  before_action :authorize

  def index
    @shopping_cart = ShoppingCart.all
  end

  def new
    @shopping_cart = ShoppingCart.new
  end

  def create
    @shopping_cart = ShoppingCart.create(shopping_cart_params)
    redirect_to shopping_cart_path(@shopping_cart)
  end

  def show
  end

  def edit
  end

  def update
    @shopping_cart.update(shopping_cart_params)
    redirect_to shopping_cart_path(@shopping_cart)
  end

  def delete
    @shopping_cart.destroy
    redirect_to shopping_carts_path
  end

    private

    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id, :vacuum_id)
    end

    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

end
