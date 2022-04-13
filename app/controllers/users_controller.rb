class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
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
