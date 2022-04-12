Rails.application.routes.draw do
  # topページ
  root 'homes#top'

  # 新規登録
  resource :user, only:[:new, :create, :show]

  # ログイン
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"


end
