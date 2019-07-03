class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.all_products
  end

  def filter
    @products = Product.filter_by_sub_category(params[:category])
  end
end
