Rails.application.routes.draw do
  devise_for :users
  get "/",             to: "roots#index"
  get "users/sign_up", to: "dedevise/registrations#new"
end
