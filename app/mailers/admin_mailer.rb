class AdminMailer < ApplicationMailer
  default from: 'bicravetonchaton@yopmail.com'

  def new_order_received(user, cart)
    @admin = 'bicravetonchaton@yopmail.com'
    @user = user
    @cart = cart

    mail(to: @admin, subject: `Vous avez reçu une nouvelle commande !`)
  end
end