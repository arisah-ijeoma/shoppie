class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, default: '', null: false
      t.boolean :visible, default: true, null: false
      t.string :status, default: 'active', null: false
    end
  end
end
