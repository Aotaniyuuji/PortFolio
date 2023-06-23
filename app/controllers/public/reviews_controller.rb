class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:update,:destroy]
  before_action :is_matching_login_user, only: [:update,:destroy]

  def create
    game = Game.find(params[:game_id])
    review = current_user.reviews.new(review_params)
    review.game_id = game.id
    if review.save
      flash[:success] = "投稿しました"
      redirect_to game_path(game)
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to request.referer
    end
  end

  def edit
    @game = Game.find(params[:id])
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      flash[:success] = "レビューを編集しました。"
      redirect_to game_path(review.game_id)
    else
      flash[:danger] = "更新できませんでした。"
      render :edit
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "レビューを削除しました"
    redirect_to game_path(params[:game_id])
  end

  private

  def review_params
    params.require(:review).permit(:title,:comment,:star,:user_id,:game_id)
  end

  def is_matching_login_user
    review = Review.find(params[:id])
    unless review.user_id == current_user.id
      render :edit
    end
  end
end
