Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :products, only: [:show, :new, :create,:update,:destroy]
  end
  resources :products, only: [:index]
  root "products#index"
end
