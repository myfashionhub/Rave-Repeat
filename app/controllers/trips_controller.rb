class TripsController < ApplicationController
  def create
    @raver = current_raver
    trip = Trip.create(raver_id: @raver.id, festival_id: params[:trip][:festival_id])
    redirect_to raver_trip_path(@raver, trip)
  end

  def edit
    @raver = current_raver
    @trip  = Trip.find(params[:id])
  end

  def update
  end
end
