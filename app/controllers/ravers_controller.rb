class RaversController < ApplicationController
  def index
    @ravers = Raver.all
  end

  def show
    @raver = current_raver
    @festivals = Festival.where('start_date >= ?', Date.today)
    @trip  = Trip.new
    @trips = Trip.where(raver_id: @raver.id)
  end

  def trips
    if params[:upcoming]
      trips = Trip.where(raver_id: current_raver.id)
                .where('start_date >= ?', Date.today)
    elsif params[:past]
      trips = Trip.where(raver_id: current_raver.id)
                .where('start_date < ?', Date.today)
    end
    render json: trips.to_json
  end

end
