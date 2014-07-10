Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback' => 'sessions#signin_twitter'
  get '/auth/facebook/callback'=> 'sessions#signin_facebook'
  get '/logout'                => 'sessions#destroy'

  resources :ravers, only: [:show, :index, :update] do
    resources :trips, only: [:new, :create, :update, :delete]
  end

  resources :festivals, only: [:index, :show]
end
