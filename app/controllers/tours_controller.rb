class ToursController <  ApplicationController
    before_action :checkUser

    def checkUser
        if session[:user_id]==nil
            redirect_to sign_up_path, notice: "Logged Out"
        else
            @user = User.find(session[:user_id])
        end
    end

    def showAllTour
        @tours = Tour.all
        @tickets = Ticket.all
        # puts @tours[0]
        render "show_all"
    end

    def showTour
        puts params
        @chosen_tour = Tour.find(params[:param])
        render "showTour"
    end

    def bookTicketWithoutCompanion
        tour = Tour.find(params[:param])
        user = User.find(session[:user_id])
        if tour.passenger_limit == 0
            flash[:error] = "Tour is completely booked!"
        redirect_to tours_path
        else
            new_ticket = Ticket.new
            new_ticket.user_id = user.id
            new_ticket.tour_id = tour.id

            new_ticket.save
        end
        flash[:success] = "Successfully Booked Ticket for " + tour.tour_code.to_s
        tour.passenger_limit = tour.passenger_limit - 1
        tour.save
        redirect_to tours_path
    end

    def bookTicketWithCompanion
        tour = Tour.find(params[:param])
        user = User.find(session[:user_id])
        
        if tour.passenger_limit == 0
            flash[:error] = "Tour is completely booked!"
            redirect_to tours_path
        else
            new_ticket = Ticket.new
            new_ticket.user_id = user.id
            new_ticket.tour_id = tour.id

            if Companion.find_by(tour_id: tour.id, gender: user.gender).present?
                companion_to_remove = Companion.find_by(tour_id: tour.id, gender: user.gender)
                
                ticket_to_update = Ticket.find(companion_to_remove.ticket_id)
                ticket_to_update.companion_user_name = user.user_name
                ticket_to_update.save

                new_ticket.companion_user_name = User.find(companion_to_remove.user_id).user_name
                new_ticket.save
                companion_to_remove.delete
            else
                companion_to_add = Companion.new
                
                new_ticket.save
                
                companion_to_add.gender = user.gender
                companion_to_add.tour_id = tour.id
                companion_to_add.user_id = user.id
                companion_to_add.ticket_id = new_ticket.id
                companion_to_add.save
            end
            flash[:success] = "Successfully Booked Ticket for " + tour.tour_code.to_s
            tour.passenger_limit = tour.passenger_limit - 1
            tour.save
            redirect_to tours_path
        end
    end
end