Rails.application.routes.draw do
  
  # 公開ページ
  root 'static_pages#top'
  
  
  # 管理者ページ
    
  
  namespace :admin do
    get ":id/management/show", to: "managements#show"
    resources :registrations, expect: [:show]
    resources :sessions, only: [:new, :create, :destroy]
    namespace :session do
      post "line_login"
    end
      
  end
  
  # フリーランス会員ページ
  namespace :freelances do
    resources :registrations
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  
  # オーナー会員ページ
  namespace :owners do
    resources :registrations
    resources :sessions, only: [:new, :create, :destroy]
  end
  # 店舗ページ
  resources :shops
  
  post "line_login", to: "session#line_log"
  
end
