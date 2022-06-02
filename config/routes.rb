Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[ edit update index new create ]
  resources :users, only: %i[ show ]

  put 'accept/invitation/:invitation_id', controller: :users, action: 'accept_invitation', as: :accept_invitation

  resources :events do
    member do
      delete 'unattend'
      post 'invite/:user_id', action: 'invite', as: :invite_user
    end

    resources :attendances, only: %i[ destroy create ]

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
