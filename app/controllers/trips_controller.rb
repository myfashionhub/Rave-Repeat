class TripsController < ApplicationController
  def create
    @raver      = current_raver
    festival_id = params[:trip][:festival_id]
    @trip = Trip.create(raver_id: @raver.id, festival_id: festival_id)
    redirect_to "/trips/#{@trip.id}"
  end

  def edit
    @raver    = current_raver
    @trip     = Trip.find(params[:id])
    @festival = Festival.find(@trip.festival_id)

    @date1    = convert_date(@festival.start_date - 1)
    @date2    = convert_date(@festival.end_date + 1)
    Trip.flight(@raver.location, @festival.location, @date1, @date2)
  end

  def update
  end
end
