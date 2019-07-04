class ApplicationController < ActionController::Base
  layout :layout

  private

  def layout
    devise_controller? ? 'devise' : 'application'
  end
end
