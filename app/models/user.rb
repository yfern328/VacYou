class User < ApplicationRecord
  has_one :shopping_cart
  has_many :reviews
  has_many :rentals
  has_many :vacuums, through: :rentals
  has_many :vacuums, through: :shopping_carts
end
