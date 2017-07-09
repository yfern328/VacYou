class VacuumsController < ApplicationController

  before_action :set_vacuum, only: [:show, :edit, :update, :delete]

  def index
    @vacuums = Vacuum.all
  end

  def new
    @vacuum = Vacuum.new
  end

  def create
    @vacuum = Vacuum.create(vacuum_params)
    redirect_to vacuum_path(@vacuum)
  end

  def show
    @vacuum = Vacuum.find(params[:id])
  end

  def edit
    @vacuum = Vacuum.find(params[:id])
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
