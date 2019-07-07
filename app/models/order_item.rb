class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :admin_user

  delegate :name, :price, :image, :category, to: :product

  scope :items_for, ->(admin_user) { where(admin_user: admin_user) }

  def sub_total
    price * quantity
  end
end
