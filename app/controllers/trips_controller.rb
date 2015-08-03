class TripsController < ApplicationController

  def create
    params[:raver_id] = current_raver.id
    trip_id = Trip.create_new(params)
    redirect_to "/trips/#{trip_id}"
  end

  def show
    @raver    = current_raver
    @trip     = Trip.find(params[:id])
    @festival = Festival.find(@trip.festival_id)
    flight    = Flight.find_by(trip_id: @trip.id)

    respond_to do |format|
      format.html
      format.json { render json: { trip: @trip, flight: flight} }
    end
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
    trip   = Trip.find(params[:id])
    render json: { lineup: trip.lineup }.to_json
  end

  def update_lineup
    trip = Trip.find(params[:trip_id])
    trip.update(lineup: params[:lineup].uniq)
    render json: { msg: "Updated lineup" }.to_json
  end


  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    render json: trip.to_json
  end

end
