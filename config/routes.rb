Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  get '/raver' => 'ravers#show'
  get '/trips/:id' => 'trips#edit'
  post '/flights'  => 'trips#flight'
  resources :ravers, only: [:index, :update] do
    resources :trips, only: [:new, :create, :update, :delete]
  end

  resources :festivals, only: [:index, :show]
end

# root GET   /                                     welcome#index
#  auth_twitter_callback GET   /auth/twitter/callback(.:format)      sessions#signin_twitter
# auth_facebook_callback GET   /auth/facebook/callback(.:format)     sessions#signin_facebook
#                 logout GET   /logout(.:format)                     sessions#destroy
#                  raver GET   /raver(.:format)                      ravers#show
#                        GET   /trips/:id(.:format)                  trips#edit
#            raver_trips POST  /ravers/:raver_id/trips(.:format)     trips#create
#         new_raver_trip GET   /ravers/:raver_id/trips/new(.:format) trips#new
#             raver_trip PATCH /ravers/:raver_id/trips/:id(.:format) trips#update
#                        PUT   /ravers/:raver_id/trips/:id(.:format) trips#update
#                 ravers GET   /ravers(.:format)                     ravers#index
#                        PATCH /ravers/:id(.:format)                 ravers#update
#                        PUT   /ravers/:id(.:format)                 ravers#update
#              festivals GET   /festivals(.:format)                  festivals#index
#               festival GET   /festivals/:id(.:format)              festivals#show
