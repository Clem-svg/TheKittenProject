class CartLinesController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:create]

    def index
        @cart_lines = CartLine.all
    end

    def show
        @cart_lines = CartLine.all
    end

    def new
        @cart_line = CartLine.new
    end

    def edit
    end

    def create
        item = Item.find(params[:item_id])
        @cart_line = @cart.add_item(item)

        respond_to do |format|
            if @cart_line.save
                format.html{redirect_to @cart_line.cart, notice: 'Cart line was successfuly created'}
            else
            redirect_to root
            end
        end
    end

    def destroy
        @cart_line = CartLine.find(params[:id])
        @cart_line.destroy
        redirect_to cart_path(current_user.id)
      end  

      private
  def cart_line_params
    params.require(:cart_line).permit(:quantity,:item_id, :cart_id)
  end

end
