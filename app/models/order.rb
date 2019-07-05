class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  def add_product(product)
    current_item = order_items.find_by(product_id: product.id)
    if current_item
      current_item.increment!(:quantity)
    else
      current_item = order_items.create(product_id: product.id)
    end

    current_item
  end
end
