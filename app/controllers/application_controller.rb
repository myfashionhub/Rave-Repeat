class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_raver

  def current_raver
    Raver.find(session[:raver_id]) if session[:raver_id]
  end

end
