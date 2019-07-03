class HomeController < ApplicationController
  def index
    @parent_categories = Category.main
    @visible_categories = Category.visible
  end
end
