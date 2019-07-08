module ApplicationHelper
  def parent_categories
    Category.main
  end

  def add_to_basket_path(category_id, product_id)
    add_to_basket_category_product_path(category_id: category_id, id: product_id)
  end

  def order_items_count
    @order.order_items.for_user.sum(&:quantity) if order_has_items?
  end

  def order_has_items?
    @order.order_items.for_user.count.positive?
  end

  def flash_class(name)
    case name
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    else ''
    end
  end
end
