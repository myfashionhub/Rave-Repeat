Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  resources :ravers, only: [:index, :update, :show]
  get '/ravers/:id/trips' => 'ravers#trips'

  resources :festivals, only: [:index, :show]

  resources :trips#, only [:index]
  get '/trips/:id/lineup' => 'trips#lineup'
  post '/trips/lineup' => 'trips#update_lineup'

  resources :flights, only: [:create]
  get '/trips/:trip_id/flights' => 'flights#index'
  delete '/trips/:trip_id/flights/:flight_id' => 'flights#destroy'
  post '/flights/search' => 'flights#search'
  get '/flights/search' => 'flights#search'
end

#                   root GET    /                                 welcome#index
#  auth_twitter_callback GET    /auth/twitter/callback(.:format)  sessions#signin_twitter
# auth_facebook_callback GET    /auth/facebook/callback(.:format) sessions#signin_facebook
#                 logout GET    /logout(.:format)                 sessions#destroy
#         flights_search POST   /flights/search(.:format)         flights#search
#           trips_lineup POST   /trips/lineup(.:format)           trips#lineup
#                flights POST   /flights(.:format)                flights#create
#                 flight DELETE /flights/:id(.:format)            flights#destroy
#                  trips GET    /trips(.:format)                  trips#index
#                        POST   /trips(.:format)                  trips#create
#               new_trip GET    /trips/new(.:format)              trips#new
#              edit_trip GET    /trips/:id/edit(.:format)         trips#edit
#                   trip GET    /trips/:id(.:format)              trips#show
#                        PATCH  /trips/:id(.:format)              trips#update
#                        PUT    /trips/:id(.:format)              trips#update
#                        DELETE /trips/:id(.:format)              trips#destroy
#                 ravers GET    /ravers(.:format)                 ravers#index
#                  raver GET    /ravers/:id(.:format)             ravers#show
#                        PATCH  /ravers/:id(.:format)             ravers#update
#                        PUT    /ravers/:id(.:format)             ravers#update
#              festivals GET    /festivals(.:format)              festivals#index
#               festival GET    /festivals/:id(.:format)          festivals#show
