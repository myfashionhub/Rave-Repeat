Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  post '/flights/search' => 'flights#search'
  post '/trips/lineup' => 'trips#lineup'
  get '/trips/:trip_id/flights' => 'trips#flights'
  resources :flights, only: [:create, :destroy]
  resources :trips
  resources :ravers, only: [:index, :update, :show]

  resources :festivals, only: [:index, :show]
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
