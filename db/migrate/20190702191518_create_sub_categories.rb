class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
