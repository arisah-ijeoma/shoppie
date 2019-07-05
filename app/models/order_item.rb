class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :description, :price, :image, to: :product
end
