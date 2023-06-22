# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #退会しているか判断するメソッド
  def user_state
    #入力されたemailからアカウントを１件取得
    @user = User.find_by(email: params[:user][:email])
    #なければメソッドを終了する
    return if !@user
    #emailからアカウントを取得した場合、取得したアカウントのパスワードと入力されたパスワードが一致しているか判別
    if @user.valid_password?(params[:user][:password]) == true && @user.is_deleted == true
      redirect_to new_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
