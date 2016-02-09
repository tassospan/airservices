Rails.application.routes.draw do
  resources :clients
  root 'frontpage#index'
  resources :welcomes, only: [:index, :edit, :update]
  get '/admin', :to => 'welcomes#index'
  resources :socials, only: [:edit, :update]
  
end
