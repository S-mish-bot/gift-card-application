class RegisterController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)  
        @user.role = 0  
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to giftcard_path, notice: "Successfully created account !!"
        else 
            render :new 
        end
    end
    private
        def user_params 
            params.require(:user).permit(:username,:password,:password_confirmation,:email)
        end
end