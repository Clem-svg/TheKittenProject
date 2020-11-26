class Cart < ApplicationRecord
  has_many :cart_lines, dependent: :destroy
  has_many :items, through: :cart_lines
  has_many :orders
  belongs_to :user, optional: true

  def add_item(item)
    product = cart_lines.find_by(item: item)

    if product
      product.quantity += 1
      else
      product = cart_lines.new(item: item)
    end
    product
  end

  def total_price
    total = 0
    self.cart_lines.each do |cart_line|
      total += cart_line.item.price * cart_line.quantity
    end
    return total
  end

  def delete_item(item)
    product = cart_lines.find_by(item: item)
    product.quantity -= 1
  end

  def total
    cart_lines.to_a.sum(&:total)
  end


end
