class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def update
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.update(quantity: params[:quantity])
  end

  def destroy
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.destroy
  end
end
