class HomepageController <  ApplicationController
    before_action :checkUser

    def checkUser
        if session[:user_id]==nil
            redirect_to sign_up_path, notice: "Logged Out"
        else
            # redirect_to sign_up_path, notice: "Logged Out"
            @user = User.find(session[:user_id])
        end
    end


    def index
        render "home_page"
    end
end