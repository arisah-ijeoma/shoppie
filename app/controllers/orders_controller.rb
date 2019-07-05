class OrdersController < ApplicationController
  def show
    @order_items = @order.order_items
  end
end
