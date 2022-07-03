class SessionsController < ApplicationController
    def new 
    end


    def create
        # user = User.find_by(username: params[:login][:username])
        # if user && user.authenticate(params[:login][:password])
        #     session[:user_id] = user.id
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password]) && @user.role == 0
            session[:user_id] = @user.id.to_s
            
            redirect_to giftcard_path, notice: "Logged in Successfully !!"
        elsif @user && @user.authenticate(user_params[:password]) && @user.role == 1
            session[:user_id] = @user.id.to_s
            redirect_to admin_path, notice: "Logged in Successfully !!"
        else
            flash[:login_errors] = ["Invalid Credentials!!"]
            redirect_to sign_in_path
        end

    end

    def destroy 
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out !!"
    end

    private
        def user_params
            params.permit(:username, :password)
        end
end