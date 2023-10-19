Rails.application.routes.draw do

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  namespace :admin do
    resources :customers, only: [:index, :snow, :edit, :update]
    resources :comment_lists
    resources :categories
    resources :items, only: [:index, :show]
  end


  # 顧客用
  scope module: :public do
    root to: 'homes#top'
    get "customers/mypage" => "customers#show"
    get "customers/mypage/edit" => "customers#edit"
    patch "customers/update" => "customers#update"
    get "customers/confirm" => "customers#confirm"
    patch "customers/withdrawal" => "customers#withdrawal"
    get "/customers/post" => "customers#post"

    resources :categories, only: [:show]
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :like_lists, only: [:create, :destroy]
      resources :comment_lists
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
