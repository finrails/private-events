Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[ edit update index new create ]
  resources :users, only: %i[ show ]
  resources :events do
    resources :attendances, only: %i[ destroy create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
