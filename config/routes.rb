Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "registrations#new"

  # get "home", to: "homepage#index"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "tours", to: "tours#all"
  post "tours", to: "tours#book"

  get "tickets", to: "tickets#all"

  delete "logout", to: "sessions#destroy"
end
