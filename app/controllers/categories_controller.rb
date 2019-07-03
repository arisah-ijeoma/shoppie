class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.all_products
  end
end
