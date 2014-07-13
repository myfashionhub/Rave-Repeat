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
  end

  def update
    trip = Trip.find(params[:trip_id])
    trip.update(from_airport: params[:from_airport],
                to_airport: params[:to_airport],
                start_date: params[:start_date],
                end_date: params[:end_date])
    render json: { msg: "Updated trip" }.to_json
  end

  def lineup
    trip = Trip.find(params[:trip_id])
    trip.update(lineup: params[:lineup])
    render json: { msg: "Updated lineup" }.to_json
  end
end

#http://www.airportcodes.org/
