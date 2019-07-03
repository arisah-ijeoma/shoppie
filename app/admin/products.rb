ActiveAdmin.register Product do
  permit_params :name, :description, :price, :status, :availability_date, :image, :category_id

  remove_filter :updated_at, :created_at

  index do
    columns_to_exclude = %w[created_at updated_at image category_id]
    (Product.column_names - columns_to_exclude).each do |p|
      column p.to_sym
    end
    column 'Image' do |product|
      image_tag product.image.url, class: 'resize-for-index'
    end
    column :category
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :category, as: :select, include_blank: false
      f.input :name
      f.input :description
      f.input :price
      f.input :status, as: :select, include_blank: false, collection: Product::STATUSES
      f.input :availability_date
      f.input :image
    end
    actions
  end

  show do
    attributes_table do
      rows_to_exclude = %w[id image category_id]
      (Product.column_names - rows_to_exclude).each do |p|
        row p.to_sym
      end
      row :category
      row :image do |product|
        image_tag product.image.url
      end
    end
    active_admin_comments
  end
end
