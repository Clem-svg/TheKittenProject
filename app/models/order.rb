class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  after_create :order_send_admin, :order_send_user

  def order_send_admin
    AdminMailer.new_order_received(self.user, self).deliver_now
  end

  def order_send_user
    UserMailer.new_order(self.user, self).deliver_now
  end
end
