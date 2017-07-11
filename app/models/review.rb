class Review < ApplicationRecord
  belongs_to :user
  has_one :vacuum
end
