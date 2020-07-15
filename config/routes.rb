Rails.application.routes.draw do
  
  # 公開ページ
  root 'static_pages#top'
  
  
  # 管理者ページ
    
  
  namespace :admin do
    get ":id/management/top", to: "managements#top"
    resources :registrations, expect: [:show]
    resources :sessions, only: [:new, :create, :destroy]
    namespace :session do
      post "line_login"
    end
      
  end
  
  # フリーランス会員ページ
  resources :freelances do
    resources :choices
  end
  
  
  # オーナー会員ページ
  resources :owners do
    resources :shops
  end
  
  post "line_login", to: "session#line_log"
  
end
