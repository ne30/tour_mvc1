Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "registrations#new"

  # get "home", to: "homepage#index"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "login#new"
  post "sign_in", to: "login#create"
  post "logout", to: "login#logout"

  get "tours", to: "tours#showAllTour"
  get "chosen_tour", to: "tours#showTour"
  post "tours_with_companion", to: "tours#bookTicketWithCompanion"
  post "tours_without_companion", to: "tours#bookTicketWithoutCompanion"

  get "tickets", to: "tickets#showUserTickets"
  get "all_tickets", to: "tickets#showAllTickets"


  get "admin", to: "admin#new"
  post "admin", to: "admin#create"
  post "logout_admin", to: "admin#logout"
  
end
