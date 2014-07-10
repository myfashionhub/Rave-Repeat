class SessionsController < ApplicationController
  def signin_twitter
    user = Raver.twitter_omniauth(env['omniauth.auth'])
    session[:raver_id] = raver.id
    redirect_to raver_path
  end

  def signin_facebook
    user = Raver.facebook_omniauth(env['omniauth.auth'])
    session[:raver_id] = raver.id
    redirect_to raver_path
  end

  def destroy
    session[:raver_id] = nil
    redirect_to root_path
  end
end
