class Review < ApplicationRecord
  belongs_to :user
  belongs_to :vacuum

  def self.get_all_rentals(given_user_id)
    Rental.all.select do |rental|
      rental.user_id == given_user_id
    end.map do |rental|
      rental.vacuum
    end
  end

  def self.get_all_carts(given_user_id)
    ShoppingCart.all.select do |cart|
      cart.user_id == given_user_id
    end.map do |cart|
      cart.vacuum
    end
  end

  def self.get_all_user_vacuums(given_user_id)
    (get_all_rentals(given_user_id) + get_all_carts(given_user_id)).uniq
  end
end
