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

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to current_user.cart
    end

    generate_order(@cart)

  end

    private

    def amounts
      @cart = Cart.find_by(user_id: current_user.id)
      @amount = @cart.total_price
      @stripe_amount = (@amount * 100).to_i
    end


    def set_order
      @order = Order.find(params[:id])
    end

    def generate_order(cart)
      @order = Order.create(user: current_user)
      @order.save_cart(cart)
    end



end