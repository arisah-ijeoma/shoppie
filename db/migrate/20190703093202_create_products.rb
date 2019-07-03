class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, default: '', null: false
      t.text :description
      t.string :price, default: '', null: false
      t.string :status, default: 'active', null: false
      t.date :availability_date
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
