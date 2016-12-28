Rails.application.routes.draw do
  resources :orders
  resources :items
  resources :customers do
    member do
      get 'orders'
    end
  end



  root 'customers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
