Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  resources :ravers, only: [:index, :update, :show]
  get '/ravers/:id/trips' => 'ravers#trips'

  resources :festivals, only: [:index, :show]

  resources :trips #, only: [:destroy]
  get '/trips/:id/lineup' => 'trips#lineup'
  post '/trips/lineup' => 'trips#update_lineup'

  resources :flights, only: [:create, :destroy]
  get '/trips/:trip_id/flights' => 'flights#index'
  get '/flights/search' => 'flights#search'
end
