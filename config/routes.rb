Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/", to: "application#index", as: "home"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/400', to: 'errors#error_400', as: "bad_request"
  get '/404', to: 'errors#error_404', as: "not_found"

  get '/users/:id/cart', to: 'users#check_cart', as: "check_cart"
  post '/users/:id/cart', to: 'users#added_to_cart', as: "add_to_cart"
  patch '/users/:id/cart', to: 'users#removed_from_cart', as: "remove_from_cart"


  resources :users, :reviews, :shopping_carts, :vacuums, :styles, :rentals
  # resources :vacuums
  # resources :reviews
  # resources :shopping_carts

end
