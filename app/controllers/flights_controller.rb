class FlightsController < ApplicationController
  def create
    flight = Flight.create(

    )
    trip = Trip.find(id)
    trip.flights << flight
  end

  def destroy
  end
end
