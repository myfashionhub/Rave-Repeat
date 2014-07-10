class TripsController < ApplicationController
  def create
    @raver = current_raver
    trip = Trip.create(raver_id: @raver.id, festival_id: params[:festival_id])
    redirect_to raver_trip_path(@raver, trip)
  end

  def edit
  end

  def update
  end
end
