class Rental < ApplicationRecord
  belongs_to :user
  has_many :vacuums
  has_many :reviews, through: :vacuums
end
