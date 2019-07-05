Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resource :order, only: :show
  resource :order_item, only: :update
  resources :categories, only: :show do
    get :filter
    resources :products, only: :show do
      member do
        get :add_to_basket
      end
    end
  end
end
