class SessionsController < ApplicationController
  def signin_twitter
    raver = Raver.twitter_omniauth(env['omniauth.auth'])
    session[:raver_id] = raver.id
    redirect_to raver_path(raver)
  end

  def signin_facebook
    raver = Raver.facebook_omniauth(env['omniauth.auth'])
    session[:raver_id] = raver.id
    redirect_to raver_path(raver)
  end

  def destroy
    session[:raver_id] = nil
    redirect_to root_path
  end
end
