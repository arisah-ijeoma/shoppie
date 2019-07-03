ActiveAdmin.register Product do
  permit_params :name, :description, :price, :status, :availability_date, :image, :category_id
end
# continue from - Carrierwave for images
