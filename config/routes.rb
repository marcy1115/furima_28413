Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/sign_up", to: "devise/registrations#new"
  resources :users, only: [ :new, :create ]
  resources :items, only: [ :index ]
end
