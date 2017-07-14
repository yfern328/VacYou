class ShoppingCart < ApplicationRecord
  belongs_to :user
  belongs_to :vacuum

  def self.user_carts(session_user_id)
    self.all.select { |cart| cart.user_id == session_user_id && cart.is_purchased == false}
  end

  def self.total(session_user_id)
    if user_carts(session_user_id).empty?
      0
    else
      user_carts(session_user_id).map {|cart| cart.vacuum.purchase_price}.reduce(:+)
    end
  end

  def self.display_cart(session_user_id)
    user_carts(session_user_id).each_with_object(Hash.new(0)) {|cart, items_hash| items_hash[cart.vacuum.name] += 1 }.sort.to_h
  end

  def self.user_purchased_items(session_user_id)
    self.all.select { |cart| cart.user_id == session_user_id && cart.is_purchased == true}
  end

  def self.display_purchased_items(session_user_id)
    user_purchased_items(session_user_id).each_with_object(Hash.new(0)) {|cart, items_hash| items_hash[cart.vacuum.name] += 1 }.sort.to_h
  end

end
