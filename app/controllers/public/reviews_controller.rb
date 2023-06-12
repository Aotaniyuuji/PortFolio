class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.user_id = current_user.id
      @review.save
      redirect_to game_path(@review.game.id)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:comment,:user_id,:game_id)
  end
end
