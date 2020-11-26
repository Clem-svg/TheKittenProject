class Item < ApplicationRecord
  has_many :cart_lines, dependent: :nullify
  has_many :carts, through: :cart_lines
end
