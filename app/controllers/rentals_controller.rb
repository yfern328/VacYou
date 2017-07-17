class RentalsController < ApplicationController

  before_action :set_rental, only: [:show, :edit, :update, :delete]
  before_action :authorize

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @vacuum = Vacuum.find(params[:rental][:vacuum_id])
    @rental = Rental.new(rental_params)

    if (@vacuum.rental_price.to_i * @rental.rental_duration.to_i) < current_user.wallet
      current_user.wallet -= (@vacuum.rental_price.to_i * @rental.rental_duration.to_i)
      current_user.save
    else
      return redirect_to user_path(current_user)
    end

    @rental.save
    @vacuum.rental_stock -= 1
    @vacuum.save
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
  end

  def update
    @rental.update(rental_params)
    redirect_to rental_path(@rental)
  end

  def delete
    @rental.destroy
    redirect_to rentals_path
  end

  def returned
    @rental = Rental.find(params[:id].to_i)
    @rental.is_returned = true
    @rental.save

    @vacuum = @rental.vacuum
    @vacuum.rental_stock += 1
    @vacuum.save

    if !(@rental.created_at + @rental.rental_duration.days).future?
      current_user.wallet -= 50
      current_user.save
    end

    redirect_to user_path(session[:user_id])
  end

    private

    def rental_params
      params.require(:rental).permit(:user_id, :vacuum_id, :rental_duration, :rental_condition, :rental_description, :is_returned)
    end

    def set_rental
      @rental = Rental.find(params[:id])
    end

end
