class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order.order_items.where.not(status: 'Basket').update(status: 'Basket')
    @order_items = @order.order_items
  end

  def address
    @order.order_items.where.not(status: 'Address').update(status: 'Address')
    @order_items = @order.order_items
  end
end
