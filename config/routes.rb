Rails.application.routes.draw do
  resources :products
  resources :product_categories
  resources :product_lines
  resources :cooperatives
  resources :barangays
  resources :municipalities do 
    get :selected, on: :member
  end
  resources :provinces do 
    get :selected, on: :member
  end
  resources :regions do 
    get :selected, on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cooperatives#index"
end
