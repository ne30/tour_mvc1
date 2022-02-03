class ToursController <  ApplicationController

    def all
        @tours = Tour.all
        puts @tours[0]
        render "show_all"
    end

    def book
        puts "Hit at book"
        puts params
        tour = Tour.find(params[:param])
        user = User.find(session[:user_id])
        # companions = Companion.all
        # tickets = Ticket.all

        if Ticket.find_by(user_id: user.id, tour_id: tour.id).present?
            puts "already booked"
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
        end
    end
end