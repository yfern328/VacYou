Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/", to: "application#index", as: "home"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get '/users/new_admin', to: 'users#new_admin', as: "new_admin"
  get '/choose_profile', to: 'users#choose_profile', as: 'choose_profile'
  post '/users' => 'users#create'

  get '/400', to: 'errors#error_400', as: "bad_request"
  get '/404', to: 'errors#error_404', as: "not_found"

  get '/users/:id/cart', to: 'users#check_cart', as: "check_cart"
  post '/users/:id/cart', to: 'users#added_to_cart', as: "add_to_cart"
  patch '/users/:id/cart', to: 'users#removed_from_cart', as: "remove_from_cart"
  post '/users/:id', to: 'users#show_after_purchase', as: 'purchase_items'
  patch '/users/:id', to: 'users#show_after_return', as: 'return_items'

  post '/rentals/:id/return', to: 'rentals#returned', as: 'return_rental'
  get '/users/:id/reviews', to: 'users#reviews', as: 'user_reviews'


  resources :users, :reviews, :shopping_carts, :vacuums, :styles, :rentals
  resources :about, only: :index
  # resources :vacuums
  # resources :reviews
  # resources :shopping_carts

end
