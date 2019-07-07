class MoveStatusToOrderItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :status
    add_column :order_items, :status, :string, default: 'Basket', null: false
  end
end
