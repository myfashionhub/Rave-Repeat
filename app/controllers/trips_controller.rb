class TripsController < ApplicationController
  def index
    raver = current_raver
    trips = raver.trips.to_a
    render json: trips.to_json
  end

  def create
    @raver      = current_raver
    festival_id = params[:trip][:festival_id]
    festival    = Festival.find(festival_id)
    @trip = Trip.create(raver_id: @raver.id,
      festival_id: festival_id,
      to_airport: festival.location,
      start_date: convert_date(festival.start_date - 1),
      end_date: convert_date(festival.end_date + 1),
    )
    redirect_to "/trips/#{@trip.id}"
  end

  def show
    @raver    = current_raver
    @trip     = Trip.find(params[:id])
    @festival = Festival.find(@trip.festival_id)
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(from_airport: params[:from_airport],
                to_airport: params[:to_airport],
                start_date: params[:start_date],
                end_date: params[:end_date])
    render json: { msg: "Updated trip" }.to_json
  end

  def lineup
    trip = Trip.find(params[:trip_id])
    trip.update(lineup: params[:lineup].uniq)
    render json: { msg: "Updated lineup" }.to_json
  end
end

#http://www.airportcodes.org/
