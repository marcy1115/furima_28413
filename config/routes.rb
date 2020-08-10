Rails.application.routes.draw do
  devise_for :users
  get "users/sign_up", to: "dedevise/registrations#new"
  resources :users
end
