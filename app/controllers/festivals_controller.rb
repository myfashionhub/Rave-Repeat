class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
  end

  def show
    @festival = Festival.find(params[:id])
    trips    = Trip.where(festival_id: @festival.id)
    @ravers  = []
    trips.each do |trip|
      @ravers.push(Raver.find(trip.raver_id))
    end

    respond_to do |format|
      format.html
      format.json { render json: @ravers.to_json }
    end
  end
end
