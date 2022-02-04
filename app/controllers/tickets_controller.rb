class TicketsController < ApplicationController
    before_action :checkUser

    def checkUser
        if session[:user_id]==nil
            redirect_to sign_up_path, notice: "Logged Out"
        else
            @user = User.find(session[:user_id])
        end
    end

    def showUserTickets 
        @tickets = @user.tickets
    end

    def showAllTickets
        @all_tickets = Ticket.all
    end
end