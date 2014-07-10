class FestivalsController < ApplicationController
  def show
    @festival = Festival.find(params[:id])
    trips    = Trip.where(festival_id: festival.id)
    @ravers  = []
    trips.each do |trip|
      Raver.find(trip.raver_id) >> @ravers
    end
  end
end
