class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :delete]

  def index
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    redirect_to review_path(@review)
  end

  def show
  end

  def edit
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
