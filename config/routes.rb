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
    resources :customers
    resources :comment_lists
    resources :categories
    resources :items
  end


  # 顧客用
  scope module: :public do
  root to: 'homes#top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
