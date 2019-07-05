class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :price, :image, :admin_user, :category, to: :product

  def sub_total
    price * quantity
  end
end
