class VacuumsController < ApplicationController

  before_action :set_vacuum, only: [:show, :edit, :update, :delete]

  def index
    @vacuums = Vacuum.all
  end

  def new
    @vacuum = Vacuum.new
  end

  def create
    @vacuum = Vacuum.new(vacuum_params)
    @vacuum.save
    redirect_to vacuum_path(@vacuum)
  end

  def show
    return redirect_to new_user_path if !logged_in
    @user = User.find(session[:user_id])
  end

  def edit
  end

  def update
    @vacuum.update(vacuum_params)
    redirect_to vacuum_path(@vacuum)
  end

  def delete
    @vacuum.destroy
    redirect_to vacuums_path
  end

    private

    def vacuum_params
      params.require(:vacuum).permit(:name, :rental_price, :purchase_price, :rental_stock, :purchase_stock)
    end

    def set_vacuum
      @vacuum = Vacuum.find(params[:id])
    end

end
