class TicketsController < ApplicationController
    before_action :checkUser

    def checkUser
        if session[:user_id]==nil
            redirect_to sign_up_path, notice: "Logged Out"
        end
    end

    def showUserTickets 
        #TODO function name show
        @user = User.find(session[:user_id])
        @tickets = @user.tickets
        render "show_all"
    end
end