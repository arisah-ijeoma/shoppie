class ApplicationController < ActionController::Base
  layout :layout

  private

  def layout
    devise_controller? ? false : 'application'
  end
end
