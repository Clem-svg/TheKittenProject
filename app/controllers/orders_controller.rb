class OrdersController < ApplicationController
  before_action :amounts

  def new
  end

  def create
    begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @stripe_amount,
        description: 'Paiement de user.email',
        currency: 'eur',
        })
        Order.create(cart: @cart, user_id: current_user)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to current_user.cart
    end

  end

    private

    def amounts
      @cart = Cart.find_by(user_id: current_user.id)
      @amount = @cart.total_price
      @stripe_amount = (@amount * 100).to_i
    end

    def order_params
      post_params = params.require(:event).permit(:start_date, :title, :duration, :description, :price, :location, :picture)

    end


end