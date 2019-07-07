ActiveAdmin.register OrderItem do
  config.remove_action_item(:new)
  actions :all, except: :create

  controller do
    def scoped_collection
      @order_items = OrderItem.items_for(current_admin_user)
    end
  end
end
