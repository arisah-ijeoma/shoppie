class HomeController < ApplicationController
  def index
    @parent_categories = Category.main
    @visible_products = Category.visible_products
  end
end
