class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_raver,
                :convert_date,
                :display_date, :display_year

  def current_raver
    Raver.find(session[:raver_id]) if session[:raver_id]
  end

  def convert_date(date)
    Date.parse(date.to_s).strftime("%m/%d/%Y")
  end

  def display_date(date)
    date.strftime("%B %d")
  end

  def display_year(date)
    date.strftime("%Y")
  end

end
