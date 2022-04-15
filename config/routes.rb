Rails.application.routes.draw do

  root 'homes#top'
  resources :posts, only:[:index, :new, :create, :show, :edit, :update]
  delete 'posts/:id' => 'posts#destroy', as: 'posts_destroy'
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
