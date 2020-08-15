Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/sign_up", to: "devise/registrations#new"
  post "/items/new", to: "items#new"
  resources :users, only: [ :new ]
  resources :items, only: [ :index, :new, :create ]
end
