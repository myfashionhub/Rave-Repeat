Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  get '/raver' => 'ravers#show'
  get '/ravers/:raver_id/trips/:id' => 'trips#edit'
  resources :ravers, only: [:index, :update] do
    resources :trips, only: [:new, :create, :update, :delete]
  end

  resources :festivals, only: [:index, :show]
end
