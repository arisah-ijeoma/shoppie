class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order.order_items.where.not(status: 'Basket').update(status: 'Basket')
    @order_items = @order.order_items
  end

  def address
    @order.order_items.where.not(status: 'Address').update(status: 'Address')
    @user = current_user
    @order_items = @order.order_items
  end

  def update_user_details
    @user = current_user
    name = params[:user][:name]
    address = params[:user][:address]

    if @user.update(name: name, address: address)
      @order.order_items.where.not(status: 'Complete').update(status: 'Complete', deleted: true)
      redirect_to root_path, notice: 'Order successfully placed'
    else
      render :address
    end
  end
end
