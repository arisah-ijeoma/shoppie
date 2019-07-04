class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :add_to_basket

  def show
    @product = Product.find_by(id: params[:id])
  end

  def add_to_basket
    product = Product.find_by(id: params[:id])
    @order.add_product(product)
  end
end
