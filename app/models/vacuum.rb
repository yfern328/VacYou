class Vacuum < ApplicationRecord
  #belongs_to :shopping_cart
  has_one :style
  has_many :reviews
  has_many :users, through: :reviews
  #has_and_belongs_to_many :rentals
end
