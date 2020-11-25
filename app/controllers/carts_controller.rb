class CartsController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:show]

    def create
        @cart = Cart.new(post_params)
        @cart.save

    end

    def show
        
    end

    private
    def post_params
        post_params = params.permit(:items)
    end
    
end

