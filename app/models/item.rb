class Item < ApplicationRecord
  has_many :cart_lines
  has_many :carts, through: :cart_lines
end
