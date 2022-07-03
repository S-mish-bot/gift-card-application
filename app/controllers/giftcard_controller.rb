class GiftcardController < ApplicationController
    def neworder
        @giftcoupon = Giftcoupon.new
    end

    def create 
        @giftcoupon = Giftcoupon.new(order_params)
        @giftcoupon.status = "OUT FOR DELIVERY"
        @temp_date = DateTime.now.strftime "%d/%m/%Y"
        @giftcoupon.order_date = @temp_date
        @giftcoupon.user_id = session[:user_id]
        if @giftcoupon.save 
            redirect_to giftcard_path
        else 
            render :neworder
        end
    end

    def order 
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
        @giftcoupon = Giftcoupon.all
    end

    private 
        def order_params
            params.require(:giftcoupon).permit(:first_name, :last_name, :gift_card_value, :total_amount, :mobile_no, :address, :order_date)
        end

end