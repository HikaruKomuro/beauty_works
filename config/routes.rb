Rails.application.routes.draw do

  root 'static_pages#top'
  resources :admin
  resources :freelances do
    resources :choices
  end
  resources :owners do
    resources :shops
  end
end
