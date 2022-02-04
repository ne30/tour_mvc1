Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "registrations#new"

  # get "home", to: "homepage#index"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "login#new"
  post "sign_in", to: "login#create"

  get "tours", to: "tours#showAllTour"
  post "tours", to: "tours#bookTicket"

  get "tickets", to: "tickets#showUserTickets"

  post "logout", to: "login#logout"
  # TODO post
end
