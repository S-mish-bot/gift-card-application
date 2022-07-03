class OmniauthCallbacksController < ApplicationController 
    def giftcard 
        Current.user.giftcards.create(
            first_name: ,
            last_name: ,
            gift_card_value: , 
            total_amount: , 
            mobile_no: ,
            address: , 
            order_date: ,
            status: ,
        )
    end

    def auth
        request.env['omniauth.auth']
    end
end