class Admin::ReviewsController < ApplicationController

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "レビューを削除しました。"
    redirect_to admin_game_path(params[:game_id])
  end
end
