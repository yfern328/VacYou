class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts
  has_many :vacuums, through: :shopping_carts
end
