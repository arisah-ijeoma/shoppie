ActiveAdmin.register Category do
  permit_params :name, :status, :visible, categories_attributes: %i[id name status visible]

  preserve_default_filters!
  filter :category, collection: -> { Category.main }
  remove_filter :categories

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :status, as: :select, include_blank: false, collection: Category::STATUSES
      f.input :visible

      f.has_many :categories, heading: '', new_record: 'Add new Sub Categories' do |c|
        c.inputs 'Sub Categories' do
          c.input :name
          c.input :status, as: :select, include_blank: false, collection: Category::STATUSES
          c.input :visible
        end
      end
    end
    actions
  end
end
