class Public::UsersController < ApplicationController
  before_action:authenticate_user!
  before_action:is_matching_login_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "変更しました"
      redirect_to user_path(@user.id)
    else
      flash[:danger] = "変更に失敗しました"
      render :edit
    end
  end

  def check
    @user = current_user
  end

  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted: "true")
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
