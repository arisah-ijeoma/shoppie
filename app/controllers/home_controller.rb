class HomeController < ApplicationController
  def index
    @categories = Category.main
  end
end
