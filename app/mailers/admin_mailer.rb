class AdminMailer < ApplicationMailer
  default from: 'bicravetonchaton@yopmail.com'

  def new_order_received(user, order)
    @admin = 'bicravetonchaton@yopmail.com'
    @user = user
    @order = order

    mail(to: @admin, subject: `Vous avez reçu une nouvelle commande !`)
  end
end