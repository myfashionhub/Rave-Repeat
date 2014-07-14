Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  get '/raver'        => 'ravers#show'
  post '/flights/search' => 'flights#search'
  post '/trips/lineup' => 'trips#lineup'
  resources :flights, only: [:create, :destroy]
  resources :trips, only: [:new, :create, :show, :update, :delete]
  resources :ravers, only: [:index, :update]

  resources :festivals, only: [:index, :show]
end

#  auth_twitter_callback GET    /auth/twitter/callback(.:format)  sessions#signin_twitter
# auth_facebook_callback GET    /auth/facebook/callback(.:format) sessions#signin_facebook
#                 logout GET    /logout(.:format)                 sessions#destroy
#                  raver GET    /raver(.:format)                  ravers#show
#                        GET    /trips/:id(.:format)              trips#edit
#         flights_search POST   /flights/search(.:format)         flights#search
#           trips_lineup POST   /trips/lineup(.:format)           trips#lineup
#                flights POST   /flights(.:format)                flights#create
#                 flight DELETE /flights/:id(.:format)            flights#destroy
#                  trips POST   /trips(.:format)                  trips#create
#               new_trip GET    /trips/new(.:format)              trips#new
#                   trip PATCH  /trips/:id(.:format)              trips#update
#                        PUT    /trips/:id(.:format)              trips#update
#                 ravers GET    /ravers(.:format)                 ravers#index
#                        PATCH  /ravers/:id(.:format)             ravers#update
#                        PUT    /ravers/:id(.:format)             ravers#update
#              festivals GET    /festivals(.:format)              festivals#index
#               festival GET    /festivals/:id(.:format)          festivals#show
