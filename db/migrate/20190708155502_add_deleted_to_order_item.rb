class AddDeletedToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :deleted, :boolean, default: false
  end
end
