Rails.application.routes.draw do
  root 'frontpage#index'
  resources :welcomes, only: [:index, :edit, :update]
  resources :socials, only: [:edit, :update]
  
end
