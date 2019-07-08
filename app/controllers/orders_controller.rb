class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = @order.order_items
  end

  def address
    @order_items = @order.order_items.update_all(status: 'Address')
  end
end
