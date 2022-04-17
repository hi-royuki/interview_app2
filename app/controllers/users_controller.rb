class UsersController < ApplicationController
  # ログインしているユーザーがログイン画面に行ったり、新規登録画面へ行かないようにする制限
  before_action :already_login?, only: [:new, :create]
  # ログインしていないユーザーがユーザー画面に入れないようにする制限
  before_action :login?, only: :show
  def new
    # からのモデル
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path, notice: "登録完了しました"
    else
      flash.now[:alert] = "全て入力してください"
      render :new
  end
end

  def show
    @user = current_user
    @company_names = @user.company_name.all
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
