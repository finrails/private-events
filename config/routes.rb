Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[ index ]
  resources :users, only: %i[ show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
