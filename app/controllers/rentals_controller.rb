class RentalsController < ApplicationController

  before_action :set_rental, only: [:show, :edit, :update, :delete]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.create(rental_params)
    redirect_to rental_path(@rental)
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental.update(rental_params)
    redirect_to rental_path(@rental)
  end

  def delete
    @rental.destroy
    redirect_to rentals_path
  end

    private

    def rental_params
      params.require(:rental).permit(:user_id, :vaccum_id, :rental_duration)
    end

    def set_rental
      @rental = Rental.find(params[:id])
    end

end
