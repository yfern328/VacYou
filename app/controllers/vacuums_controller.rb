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
    return redirect_to signup_path if !logged_in
    @user = current_user
    @reviews = Review.all.select {|review| review.vacuum_id == @vacuum.id}
    ratings = @reviews.map {|review| review.emoji_rating.to_i}
    @average_rating = ratings.reduce(:+) / ratings.length
  end

  def edit
    if session[:user_id]
      redirect_to vacuum_path(@vacuum) unless current_user.is_admin
    else
      redirect_to signup_path
    end
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
