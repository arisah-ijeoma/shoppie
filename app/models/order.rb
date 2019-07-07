class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  scope :user_list_for, ->(admin_user) { joins(:order_items).where(order_items: { admin_user: admin_user }).pluck(:user_id) }

  def add_product(product)
    current_item = order_items.find_by(product_id: product.id, admin_user_id: product.admin_user.id)
    if current_item
      current_item.increment!(:quantity)
    else
      current_item = order_items.create(product_id: product.id, admin_user_id: product.admin_user.id)
    end

    current_item
  end

  def total
    order_items.sum(&:sub_total)
  end
end
