class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :price, :image, :admin_user, to: :product
end
