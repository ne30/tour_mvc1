class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(user_name: params[:user_name])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            puts "hello " + user.user_name
            redirect_to home_path, notice: "tours list"
        else
            flash[:error] = "Invalid user_name or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to sign_up_path, notice: "Logged Out"
    end
end