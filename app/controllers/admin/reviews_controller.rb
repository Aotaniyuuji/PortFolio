class Admin::ReviewsController < ApplicationController
  before_action:authenticate_admin!

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "レビューを削除しました。"
    redirect_to admin_game_path(params[:game_id])
  end
end
