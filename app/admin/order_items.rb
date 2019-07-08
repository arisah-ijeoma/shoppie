ActiveAdmin.register OrderItem do
  config.remove_action_item(:new)
  actions :all, except: :create

  controller do
    def scoped_collection
      @order_items = OrderItem.items_for(current_admin_user)
    end
  end

  index do
    columns_to_exclude = %w[id order_id admin_user_id product_id deleted]
    column 'User' do |order_item|
      order_item.order.user.email
    end
    column :product
    (OrderItem.column_names - columns_to_exclude).each do |p|
      column p.to_sym
    end
    actions
  end
end
