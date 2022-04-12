class ApplicationController < ActionController::Base
  # viewでも使えるようにする
  helper_method :current_user

  def login?
    if current_user.nil?
      redirect_to login_path, alert: "ログインする必要があります。"
    end
  end

  def already_login?
    unless current_user.nil?
      redirect_to user_path, notice: "ログイン済みです。"
    end
  end

  def current_user
    # もしもsession[user_id]がnilではなかったら
    if session[:user_id]
      # sessionのidでユーザを見つけてきて、current_userていう変数に入れる
      # よってcurrent_userというメソッドを実行するとこのcurrent_userが替えってくる
      current_user ||= User.find(session[:user_id])
    end
  end
end

