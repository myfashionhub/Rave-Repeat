class TripsController < ApplicationController
  def index
    raver = current_raver
    trips = raver.trips.to_a
    current_trips  = trips.map do |trip|
      festival = Festival.find(trip.festival_id)
      begin
        flight   = Flight.find_by(trip_id: trip.id)
        { festival: festival.name,
          airline: flight.airline,
          start_date: trip.start_date,
          end_date: trip.end_date,
          from_airport: trip.from_airport,
          to_airport: trip.to_airport,
          lineup: trip.lineup,
          leg1: flight.leg1,
          leg2: flight.leg2,
          trip_id: trip.id
        }
      rescue NoMethodError # needs refactoring
        { festival: festival.name,
          airline: 'Not specified',
          start_date: trip.start_date,
          end_date: trip.end_date,
          from_airport: trip.from_airport,
          to_airport: trip.to_airport,
          lineup: 'Not specified',
          leg1: 'Not specified',
          leg2: 'Not specified',
          trip_id: trip.id
        }
      end
    end
    current_trips.sort_by!{ |trip| [trip[:start_date].slice(-1,4), trip[:start_date].slice(0,2)] }

    render json: current_trips.to_json
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
    @flight    = Flight.find_by(trip_id: @trip.id)

    respond_to do |format|
      format.html
      format.json { render json: { trip: @trip, flight: @flight} }
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

#http://www.airportcodes.org/
