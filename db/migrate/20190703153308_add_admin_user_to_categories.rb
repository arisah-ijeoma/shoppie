class AddAdminUserToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :admin_user, foreign_key: true
  end
end
