Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/", to: "application#index", as: "home"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users, :reviews, :shopping_carts, :vacuums, :styles, :rentals
  # resources :vacuums
  # resources :reviews
  # resources :shopping_carts

end
