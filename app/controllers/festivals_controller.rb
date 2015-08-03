class FestivalsController < ApplicationController
  def index
    @festivals = Festival.where('start_date >= ?', Date.today)
  end

  def show
    @festival = Festival.find(params[:id])
    trips     = Trip.where(festival_id: @festival.id)
    ravers    = trips.map do |trip|
      Raver.find(trip.raver_id)
    end

    respond_to do |format|
      format.html
      format.json do 
        render json: {ravers: ravers, lineup: @festival.lineup}.to_json 
      end
    end
  end

end
