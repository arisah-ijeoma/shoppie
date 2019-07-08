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
    user_name = params[:user][:name]
    user_address = params[:user][:address]
    admin_and_items = {}

    if @user.update(name: user_name, address: user_address)
      @order.order_items.where.not(status: 'Complete').update(status: 'Complete', deleted: true)

      @order.order_items.each do |order_item|
        admin_and_items[order_item.admin_user] = order_item
      end

      admin_and_items.each { |admin, _order_items| admin.order_notification }

      flash[:success] = 'Order successfully placed'
      redirect_to root_path
    else
      render :address
    end
  end
end
