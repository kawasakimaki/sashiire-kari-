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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories
    resources :items, only: [:index, :show, :destroy] do
      resources :comment_lists, only: [:destroy]
    end

  end


  # 顧客用
  scope module: :public do
    root to: 'homes#top'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    get "home/about" => "homes#about", as: "about"
    get "customers/mypage" => "customers#show"
    get "customers/mypage/edit" => "customers#edit"
    patch "customers/update" => "customers#update"
    get "customers/confirm" => "customers#confirm"
    patch "customers/withdrawal" => "customers#withdrawal"
    get "/customers/post" => "customers#post"
    get "/customers/likes" => "customers#likes" #いいね一覧
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe' # 退会画面を表示
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal' # 退会処理(customerカラムのbooleanを更新)
    get "search_tag" => "items#search_tag" # タグの検索で使用する
    get 'searche' => 'items#search' #キーワード検索を表示

    resources :categories, only: [:show]
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy, ] do
      resource :like_lists, only: [:create, :destroy]
      resources :comment_lists, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
