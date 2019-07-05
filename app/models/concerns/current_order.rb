module CurrentOrder
  private

  def set_order
    @order = Order.find_or_create_by(user: current_user)
  end
end
