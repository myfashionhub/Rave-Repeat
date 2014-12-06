class RaversController < ApplicationController
  def index
    @ravers = Raver.all
  end

  def show
    @raver = current_raver
    @festivals = Festival.where('start_date >= ?', Date.today)
    @trip  = Trip.new
    @trips = Trip.where(raver_id: @raver.id)
  end

  def trips
    if params[:past]
      trips = Trip.where(raver_id: current_raver.id)
                .where('start_date < ?', Date.today)
    elsif params[:upcoming]
      trips = Trip.where(raver_id: current_raver.id)
                .where('start_date >= ?', Date.today)
    end

    trip_info = trips.map do |trip|
      festival = Festival.find(trip.festival_id)
      #flight   = Flight.find_by(trip_id: trip.id)

      { festival: festival.name,
        start_date: display_date(trip.start_date),
        end_date: display_date(trip.end_date),
        from_airport: trip.from_airport,
        to_airport: trip.to_airport,
        lineup: trip.lineup || 'Not specified',
        trip_id: trip.id
      }
    end
    render json: trip_info.to_json
  end

end
