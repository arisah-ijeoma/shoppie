Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resource :order, only: :show do
    get :address
    put :update_user_details
  end
  resources :order_items, only: %i[update destroy]
  resources :categories, only: :show do
    get :filter
    resources :products, only: :show do
      member do
        get :add_to_basket
      end
    end
  end
end
