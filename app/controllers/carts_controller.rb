class CartsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found
    
    include CurrentCart
    before_action :set_cart

    def create
        @cart = Cart.new(post_params)
        @cart.save
    end

    def show
        
    end

    def destroy
        @cart.destroy
        session.delete(:cart_id)

        respond_to do |format|
        format.html { redirect_to root_url, notice: "Votre panier est vide"
        }
        end
    end

    private
    def post_params
        post_params = params.permit(:items)
    end

    def set_cart
        @cart = Cart.find_or_create_by(user_id: current_user.id)
      end
    
    def cart_not_found
        redirect_to root, alert: t(".cart_not_found")
    end
      


end

