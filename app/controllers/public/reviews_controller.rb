class Public::ReviewsController < ApplicationController
  # before_action :is_user_signed_in?
  def create
    game = Game.find(params[:game_id])
    review = current_user.Review.new(review_params)
    review.game_id = game.id
    if review.user_id = current_user.id
      review.save
      redirect_to game_path(game)
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
