module CurrentCart

  private

  def set_cart
    if current_user.nil?
      flash[:notice] = "Veuillez vous inscrire pour générer un panier."
      redirect_to new_user_registration_path
    else
        @cart = Cart.find_or_create_by(user_id: current_user.id)
    end
  end
end
