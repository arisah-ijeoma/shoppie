class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.all_products
  end

  def filter
    @category = Category.find_by(id: params[:category])
    @products =
      if params[:category].blank?
        category = Category.find_by(category_id: params[:category_id]).category
        category.all_products
      else
        Product.filter_by_sub_category(params[:category])
      end
  end
end
