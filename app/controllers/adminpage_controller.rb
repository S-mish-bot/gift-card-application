class AdminpageController < ApplicationController

    def order 
        if session[:user_id] && User.role == 1
            @user = User.find_by(id: session[:user_id])
        end
        @giftcoupon = Giftcoupon.all
    end

    def edit
        @giftcoupon = Giftcoupon.find(params[:id])
    end 

    def update
        @giftcoupon = Giftcoupon.find(params[:id])
        @giftcoupon.update(status: params[:giftcoupon][:status])
        redirect_to admin_path
    end

end