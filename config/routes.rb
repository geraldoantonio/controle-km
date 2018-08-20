Rails.application.routes.draw do
  
  
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'
  
  root :to => "displacements#index" 
  
  
  #root :to => "home#index"

  resources :displacements
  resources :cars
  resources :addresses
  resources :functionaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
