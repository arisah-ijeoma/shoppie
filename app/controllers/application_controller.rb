class ApplicationController < ActionController::Base
  include CurrentOrder
  layout :layout

  before_action :get_order

  private

  def layout
    devise_controller? ? 'devise' : 'application'
  end
end
