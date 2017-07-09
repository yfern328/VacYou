class ShoppingCart < ApplicationRecord


  def total
    # tax_rate = x
    # vacuum_price.sum { |p| p.price * p.tax_rate }
    # payments.sum(&:price)
  end

end
