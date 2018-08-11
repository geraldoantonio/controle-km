Rails.application.routes.draw do
  
  root :to => "displacements#index" 
  
  devise_for :users
  
  #root :to => "home#index"

  resources :displacements
  resources :cars
  resources :addresses
  resources :functionaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
