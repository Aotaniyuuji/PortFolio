class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]
  def create
    game = Game.find(params[:game_id])
    review = current_user.reviews.new(review_params)
    review.game_id = game.id
    if review.user_id = current_user.id
      review.save
      redirect_to game_path(game)
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update

  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end

  private

  def review_params
    params.require(:review).permit(:title,:comment,:star,:user_id,:game_id)
  end
end
