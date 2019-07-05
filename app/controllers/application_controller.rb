class ApplicationController < ActionController::Base
  layout :layout

  before_action :set_order

  def after_sign_in_path_for(resource)
    route_params = Rails.application.routes.recognize_path(request.referrer)

    if route_params[:action] == 'add_to_basket'
      category_product_path(route_params[:category_id], route_params[:id])
    else
      super
    end
  end

  private

  def layout
    devise_controller? ? 'devise' : 'application'
  end

  def set_order
    @order = Order.find_or_create_by(user: current_user)
  end
end
