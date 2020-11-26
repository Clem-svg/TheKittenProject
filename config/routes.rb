Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  resources :carts
  resources :items
  resources :orders
  resources :cart_lines
  resources :users do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
