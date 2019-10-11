# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin', to: 'admin#index'

  controller :sessions do
    get 'login', action: :new
    post 'login', action: :create
    delete 'logout', action: :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
