class OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find_by(id: params[:item_id])
    @order_item.update(quantity: params[:quantity])
  end
end
