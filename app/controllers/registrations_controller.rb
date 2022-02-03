class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(userParams)
        if @user.save
            session[:user_id] = @user_id
            redirect_to sign_in_path
            # redirect_to sign_up_path, notice: "Successfully created account"
            # redirect_to root_path, notice: "Successfully created account"
        else
            flash[:error] = "Something went wrong"
            render :new
        end
    end

    private

    def userParams
        params.require(:user).permit(:user_name, :gender, :password, :password_confirmation)
    end
end