class OrdersController < ApplicationController
  include CurrentCart
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

    @order = Order.create(cart: @cart, user: @user)
    @cart.destroy

  end

    private

    def amounts
      @user = User.find_by(id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
      @amount = @cart.total_price
      @stripe_amount = (@amount * 100).to_i
    end


end