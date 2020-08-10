Rails.application.routes.draw do
  devise_for :users
  root "roots#index"
  get "users/sign_up", to: "dedevise/registrations#new"

end
