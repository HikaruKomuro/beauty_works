Rails.application.routes.draw do

  root 'static_pages#top'
  
  namespace :admin do
    resources :registrations
  end
  
  resources :freelances do
    resources :choices
  end
  
  resources :owners do
    resources :shops
  end
  
  post "line_login", to: "session#line_log"
  
end
