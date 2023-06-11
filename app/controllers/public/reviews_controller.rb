class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new(review_params)
    @review.user_id = current_user.id
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
