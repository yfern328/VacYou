class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :delete]

  def index
    @reviews = Review.all
  end

  def new
    if session[:user_id]
      @review = Review.new
    else
      redirect_to signup_path
    end
  end

  def create
    @review = Review.create(review_params)
    redirect_to reviews_path
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def delete
    @review.destroy
    redirect_to reviews_path
  end

    private

    def review_params
      params.require(:review).permit(:user_id, :vacuum_id, :emoji_rating)
    end

    def set_review
      @review = Review.find(params[:id])
    end

end
