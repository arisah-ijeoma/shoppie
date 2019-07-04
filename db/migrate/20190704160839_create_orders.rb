class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, default: 'basket', null: false

      t.timestamps
    end
  end
end
