class RaversController < ApplicationController
  def index
    @ravers = Raver.all
  end

  def show
    @raver = current_raver
    @trip  = Trip.new
    @trips = Trip.where(raver_id: @raver.id)

    current_trips = @trips.map do |trip|
      festival = Festival.find(trip.festival_id)
      # flight   = Flight.find_by(trip_id: trip.id)
      { festival: festival.name,
        start:    trip.start_date,
        end:      trip.end_date,
        # airline:  flight.airline,
        # flight1:  flight.leg1,
        # flight2:  flight.leg2,
        lineup:   trip.lineup
      }

    end
    respond_to do |format|
      format.html
      format.json { render json: current_trips.to_json }
    end
  end

end
