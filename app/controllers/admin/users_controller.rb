class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = "ステータスを更新しました"
      redirect_to admin_user_path(user.id)
    else
      flash[:danger] = "更新に失敗しました。"
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
