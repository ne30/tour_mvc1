class LoginController < ApplicationController

    def new
    end

    def create
        user = User.find_by(user_name: params[:user_name])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to tours_path
        else
            flash[:error] = "Invalid user name or password"
            redirect_to sign_in_path
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to sign_up_path, notice: "Logged Out"
    end
end