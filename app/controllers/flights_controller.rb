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
    flight = Flight.create(
      leg1: params[:leg1],
      leg2: params[:leg2],
      price: params[:price],
      trip_id: params[:trip_id]
    )
    render json: { msg: 'Flight saved!' }.to_json
  end

  def destroy
    flight = Flight.find(params[:id])
    flight.destroy
    render json: { msg: 'Removed flight from itinerary.' }.to_json
  end
end
