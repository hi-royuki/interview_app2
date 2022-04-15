Rails.application.routes.draw do
  # get 'interviews/new'
  # get 'interviews/show'
  # get 'interviews/edit'
  root 'homes#top'

  # 新規登録
  resource :user, only:[:new, :create, :show] do
    resources :company_names do
      resources :interviews, only:[:create, :destroy, :edit, :update]
    end
  end

  # ログイン
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"


end
