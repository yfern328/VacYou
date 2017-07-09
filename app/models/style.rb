class Style < ApplicationRecord
  has_many :vacuums
  has_many :reviews, through: :vacuums
end
