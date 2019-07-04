module ApplicationHelper
  def parent_categories
    Category.main
  end

  def add_to_basket_path(category_id, product_id)
    add_to_basket_category_product_path(category_id: category_id, id: product_id)
  end

  def order_items_count
    @order.order_items.sum(&:quantity) if order_has_items?
  end

  def order_has_items?
    @order.order_items.count.positive?
  end
end
