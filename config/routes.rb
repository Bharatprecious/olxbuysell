Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only:[:index]
  resources :products do
    resources :rooms
  end
  root "products#index"
end
