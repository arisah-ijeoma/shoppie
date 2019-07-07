ActiveAdmin.register User do
  controller do
    def scoped_collection
      @users = User.with_orders(current_admin_user)
    end
  end

  index do
    column :email
    actions
  end

  show do
    attributes_table do
      row :email
    end
    active_admin_comments
  end
end
