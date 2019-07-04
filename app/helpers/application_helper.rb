module ApplicationHelper
  def parent_categories
    Category.main
  end

  def add_to_basket_path(category_id, product_id)
    category_product_add_to_basket_path(category_id: category_id, product_id: product_id)
  end
end
