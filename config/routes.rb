Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  get 'homes/index'
  # get 'products/index'
  # get 'products/show'
  # get 'products/edit'
  # get 'products/new'
  
  resources :products
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
