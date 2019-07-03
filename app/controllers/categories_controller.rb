class CategoriesController < ApplicationController
  def index
    category = Category.find_by(id: params[:id])
    @products = category.products
  end
end
