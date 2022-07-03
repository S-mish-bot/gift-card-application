class MainController < ApplicationController
    def index
        # flash[:notice] = "Logged in Successfully"
        # flash[:alert] = "Invalid Login Credentials"
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end