class HomeController < ApplicationController
  def index
    @visible_products = Category.visible_products
  end
end
