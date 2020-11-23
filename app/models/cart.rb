class Cart < ApplicationRecord
  has_many :cart_lines
  has_many :items, through: :cart_lines
  has_many :orders
  belongs_to :user
end
