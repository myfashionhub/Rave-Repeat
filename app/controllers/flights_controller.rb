class FlightsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    flights = trip.flights
    render json: flights.to_json
  end

  def search
    url = params[:url]
    results = Flight.search(url)
    render json: results.to_json
  end

  def create
    airline = params[:airline]
    airline.delete!("\n").squeeze! if airline.include?('\n')
    flight = Flight.create(
      leg1: params[:leg1],
      leg2: params[:leg2],
      airline: airline,
      price: params[:price],
      link: params[:link],
      trip_id: params[:trip_id]
    )
    render json: flight.to_json
  end

  def destroy
    flight = Flight.find(params[:flight_id])
    flight.destroy
    render json: flight.to_json
  end
end
