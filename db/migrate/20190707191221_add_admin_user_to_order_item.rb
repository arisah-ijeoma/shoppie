class AddAdminUserToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :admin_user, foreign_key: true
  end
end
