ActiveAdmin.register Category do
  permit_params :name, :status, :visible, :admin_user_id,
                categories_attributes: %i[id name status admin_user_id visible]

  preserve_default_filters!
  filter :category, collection: -> { Category.main }
  remove_filter :categories

  controller do
    def scoped_collection
      @categories = Category.my_categories(current_admin_user)
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :status, as: :select, include_blank: false, collection: Category::STATUSES
      f.input :visible
      f.hidden_field :admin_user_id, value: current_admin_user.id

      f.has_many :categories, heading: '', new_record: 'Add new Sub Categories' do |c|
        c.inputs 'Sub Categories' do
          c.input :name
          c.input :status, as: :select, include_blank: false, collection: Category::STATUSES
          c.input :visible
          c.input :admin_user_id, input_html: { value: current_admin_user.id }, as: :hidden
        end
      end
    end
    actions
  end
end
