class TicketsController < ApplicationController

    def all 
        @user = User.find(session[:user_id])
        @tickets = @user.tickets
        render "show_all"
    end
end