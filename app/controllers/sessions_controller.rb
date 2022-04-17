class SessionsController < ApplicationController
before_action :already_login?, except: :destroy
  def new
  end

  def create
    # find_byでユーザを見つけてくる
    user = User.find_by_email(params[:email])
    # 上の記述でメールで探してきたユーザーのパスワードがあっていれば
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスかパスワードが違います。"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
end
