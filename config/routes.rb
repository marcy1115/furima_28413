Rails.application.routes.draw do
  root "roots#index"
  get "users/sign_up", to: "dedevise/registrations#new"

end
