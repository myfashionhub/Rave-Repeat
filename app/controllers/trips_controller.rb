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
    @date1    = (@festival.start_date - 1).to_s.gsub('-','%2F')
    @date2    = (@festival.end_date + 1).to_s.gsub('-','%2F')
  #?ai=kayaksample&d=n&cars=n&tab=flights&doubleEncoded=on&l1=!&l2=<%= @festival.location %>&df=ymd&d1=<%= @date1 %>&d2=<%= @date2 %>
  end

  def update
  end
end
